package sg.dbsys.server.controller.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.ModelAndView;

import sg.dbsys.dao.model.User;
import sg.dbsys.server.controller.DispatchRequest;
import sg.dbsys.server.controller.validator.UserNameValidator;
import sg.dbsys.userbo.service.UserService;

@Controller
public class LoginController {

	private UserService userService;

	private UserNameValidator userNameValidator;

	public void setUserNameValidator(UserNameValidator userNameValidator) {
		this.userNameValidator = userNameValidator;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@RequestMapping(value = "/change", method = RequestMethod.GET)
	public String signUpPage(Model model, HttpServletRequest request) {

		/*
		 * User tempUser = userService.getUserByName(user.getUserName()); if
		 * (tempUser.getUserName().equals("user") ||
		 * tempUser.getPassword().equals("password")) { return "user_signup"; }
		 */
		User user = new User();

		model.addAttribute("user", user);
		return "user_signup";
	}
	@RequestMapping(value = "/change", method = RequestMethod.POST)
	public ModelAndView siginUp(@ModelAttribute("user") User user,
			HttpServletRequest request) {

		String loginPage = DispatchRequest.doDispactch(request, user);
		ModelAndView view = new ModelAndView(loginPage);

		if (loginPage.equals("redirect:/login")) {
			return view;
		}

		User loggedUser = (User) request.getSession()
				.getAttribute(DispatchRequest.SESSION_KEY);

		if (loggedUser != null) {
			user.setUserName(loggedUser.getUserName());
		}

		User newUser = userService.updateUser(user);
		if (newUser != null && newUser.getId() > 0) {
			return new ModelAndView("redirect:/person/list");
		} else {
			return new ModelAndView("user_signup").addObject("message",
					"User Not Created(Contact Administrator)");
		}

	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(Model model) {

		User user = new User();
		model.addAttribute("user", user);
		return "user_login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("user") User user,
			HttpServletRequest request) {

		User tempUser = userService.getUserByName(user.getUserName());
		if (tempUser == null) {
			return new ModelAndView().addObject("user", new User())
					.addObject("message", "UserName/Password is incorrect");
		} else if (user.getUserName().equals("user")
				&& user.getPassword().equals("password")) {

			request.getSession().setAttribute(DispatchRequest.SESSION_KEY,
					user);
			ModelAndView view = new ModelAndView("redirect:/change");
			view.addObject("user", user);
			return view;
		}
		request.getSession().setAttribute(DispatchRequest.SESSION_KEY,
				user);

		ModelAndView page = !userService.login(user.getUserName(),
				user.getPassword())
						? new ModelAndView("user_login").addObject("message",
								"Login Error (User Name or Password Incorrect)")
						: new ModelAndView("redirect:/person/list");
		return page;
	}

	@RequestMapping(value = "/user/signout", method = RequestMethod.GET)
	public String signOut(HttpServletRequest request, Model model) {

		User user = ((User) request.getSession()
				.getAttribute(DispatchRequest.SESSION_KEY));
		String path = DispatchRequest.doDispactch(request, user);
		if (!path.equals("")) {
			return path;
		}
		request.getSession().setAttribute(DispatchRequest.SESSION_KEY, null);
		return "redirect:/login";
	}
}

package sg.dbsys.server.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sg.dbsys.dao.model.User;
import sg.dbsys.server.controller.DispatchRequest;
import sg.dbsys.userbo.service.UserService;

@Controller
public class UserController {

	UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping(value = "/user/profile", method = RequestMethod.GET)
	public String showProfile(Model model, HttpServletRequest request) {
		String path = DispatchRequest.doDispactch(request, new User());
		if (!path.equals("")) {
			return path;
		}
		model.addAttribute("user", userService.getUserByName(
				DispatchRequest.getLoggInUser(request).getUserName()));
		return "user_profile_edit";
	}

	@RequestMapping(value = "/user/profile", method = RequestMethod.POST)
	public ModelAndView updateProfile(@ModelAttribute("user") User user,
			HttpServletRequest request, Model model) {
		String path = DispatchRequest.doDispactch(request, new User());
		if (!path.equals("")) {
			return new ModelAndView(path).addObject("user", new User());
		}

		userService.updateUser(user);

		ModelAndView view = new ModelAndView("redirect:/person/list");
		view.addObject("message", "Your profile has been updated");
		return view;
	}

}

package sg.dbsys.server.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import sg.dbsys.dao.model.Person;
import sg.dbsys.dao.model.User;
import sg.dbsys.personbo.service.PersonService;

@Controller
public class PersonController {

	private PersonService personService;

	@Autowired(required = true)
	@Qualifier(value = "personService")
	public void setPersonService(PersonService ps) {
		this.personService = ps;
	}

	@RequestMapping(value = "/person/list", method = RequestMethod.GET)
	public String listPersons(Model model) {
		model.addAttribute("person", new Person());
		model.addAttribute("listPersons", this.personService.listPersons());
		return "person_list_view";
	}

	@RequestMapping(value = "/allPersons", method = RequestMethod.GET, produces = "application/json")
	public List<Person> listAllPersons(Model model) {

		return this.personService.listPersons();
	}

	@RequestMapping(value = "person/new", method = RequestMethod.GET)
	public String showPersonPage(Model model) {
		Person person = new Person();
		model.addAttribute("person", person);
		return "person_new_create";
	}
	// For add and update person both
	@RequestMapping(value = "/person/new", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("person") Person p) {

		if (p.getId() == 0) {
			this.personService.addPerson(p);
		}

		return "redirect:/person/list";
	}

	@RequestMapping(value = "person/view/{id}", method = RequestMethod.GET)
	public String showPersonDetails(@PathVariable("id") int id) {
		Person person = personService.getPersonById(id);

		return "aperson_view";
	}
	@RequestMapping(value = "/person/addNew", method = RequestMethod.GET)
	public String addNewPerson(Model model, HttpServletRequest request) {

		User user = ((User) request.getSession()
				.getAttribute(DispatchRequest.SESSION_KEY));
		String path = DispatchRequest.doDispactch(request, user);
		if (!path.equals("")) {
			return path;
		}
		return "new_contact_form";
	}

	@RequestMapping("/person/remove/{id}")
	public String removePerson(@PathVariable("id") int id) {

		this.personService.removePerson(id);
		return "redirect:/persons";
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public ModelAndView showEditDetails(@PathVariable("id") int id,
			Model model) {
		ModelAndView modelAndView = new ModelAndView("person_edit_view");
		modelAndView.addObject("person", this.personService.getPersonById(id));

		return modelAndView;
	}

	@RequestMapping(value = "/person/edit", method = RequestMethod.POST)
	public ModelAndView editPerson(@ModelAttribute("person") Person person,
			Model model,@RequestParam("id") int id) {
		
		person.setId(id);
		personService.updatePerson(person);
		ModelAndView view = new ModelAndView("redirect:/person/list");
		view.addObject("message", "The person " + person.getFirstName() + " "
				+ person.getLastName() + " updated");
		return view;
	}
}

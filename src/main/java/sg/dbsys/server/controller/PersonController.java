package sg.dbsys.server.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sg.dbsys.dao.model.Person;
import sg.dbsys.personbo.service.PersonService;

@Controller
public class PersonController {
	
	private PersonService personService;
	
	@Autowired(required=true)
	@Qualifier(value="personService")
	public void setPersonService(PersonService ps){
		this.personService = ps;
	}
	
	@RequestMapping(value = "/persons", method = RequestMethod.GET)
	public String listPersons(Model model) {
		model.addAttribute("person", new Person());
		model.addAttribute("listPersons", this.personService.listPersons());
		return "_person_view";
	}
	
	@RequestMapping(value = "/allPersons", method = RequestMethod.GET,produces = "application/json")
	public List<Person> listAllPersons(Model model) {
		
		return this.personService.listPersons();
	}
	//For add and update person both
	@RequestMapping(value= "/person/add", method = RequestMethod.GET)
	public String addPerson(@ModelAttribute("person") Person p){
		
//		if(p.getId() == 0){
//			//new person, add it
//			this.personService.addPerson(p);
//		}else{
//			//existing person, call update
//			this.personService.updatePerson(p);
//		}
//		
		//return "redirect:/persons";
		return "_add_person_view";
	}
	
	@RequestMapping("/remove/{id}")
    public String removePerson(@PathVariable("id") int id){
		
        this.personService.removePerson(id);
        return "redirect:/persons";
    }
 
    @RequestMapping("/edit/{id}")
    public String editPerson(@PathVariable("id") int id, Model model){
        model.addAttribute("person", this.personService.getPersonById(id));
        model.addAttribute("listPersons", this.personService.listPersons());
        return "person";
    }
	
}

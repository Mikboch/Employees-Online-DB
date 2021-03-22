package bdbt_proj;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Predicate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AppController {

	@Autowired
	private EmployeesDAO dao;
	
	@Autowired
	private AddressesDAO daoAddr;
	
	@Autowired
	private FactoriesDAO daoFact;
	
	@Autowired
	private PositionsDAO daoPos;
	
	public boolean checkIfEmployeeExists(int id_uzytkownika) {
		
		List<Employees> listOfEmployees = dao.list(); 	
		
		if(listOfEmployees.contains(id_uzytkownika))
			return true;
		else
			return false;
	}
	
	@RequestMapping("/user")
    public String viewUserPage(Model model, @RequestParam(value = "id_uzytkownika") int id_uzytkownika) {
		
        Employees employee = dao.get(id_uzytkownika);
        Addresses address = daoAddr.get(employee.getId_adresu());
        Positions position = daoPos.get(employee.getId_stanowiska());
        Factories factory = daoFact.get(employee.getId_fabryki());
        
        
        model.addAttribute("listOfEmployees", employee);
        model.addAttribute("listOfAddresses", address);
        model.addAttribute("listOfPositions", position);
        model.addAttribute("listOfFactories", factory);

        return "user";
		
	}		
	
	@RequestMapping("/editUser/{id_pracownika}")
	public ModelAndView editUserInfo(@PathVariable(name = "id_pracownika") int id_pracownika){
		
		ModelAndView nav = new ModelAndView("edit_user");
		Employees employee = dao.get(id_pracownika);
		nav.addObject("employee", employee);

		return nav;
		
		//return "edit_user";
	}
	
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("employee") Employees employee) {

		dao.update(employee);
		return "redirect:/user?id_uzytkownika="+employee.getId_pracownika();
	}
	
	
	
	@RequestMapping("/")
	public String viewAdminPage(Model model) {

		List<Employees> listOfEmployees = dao.list();
		model.addAttribute("listOfEmployees", listOfEmployees);
		
		//System.out.println(listOfEmployees.get(0).getImie());
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String whoAmI = authentication.getName();
		
		if(whoAmI=="anonymousUser")
			return "index";
		return "in_"+whoAmI; // tutaj jest zwracany nasz plik index.html
	}
	
	
	
	@RequestMapping("/addresses")
	public String showAddressesPage(Model model) {

		List<Addresses> listOfAddresses = daoAddr.list();
		model.addAttribute("listOfAddresses", listOfAddresses);
		return "addresses"; // tutaj jest zwracany nasz plik index.html
	}
	
	@RequestMapping("/factories")
	public String showFactoriesPage(Model model) {

		List<Factories> listOfFactories = daoFact.list();
		model.addAttribute("listOfFactories", listOfFactories);
		return "factories"; // tutaj jest zwracany nasz plik index.html
	}

	
	@RequestMapping("/positions")
	public String showPositionsPage(Model model) {

		List<Positions> listOfPositions = daoPos.list();
		model.addAttribute("listOfPositions", listOfPositions);
		return "positions"; // tutaj jest zwracany nasz plik index.html
	}
	
	
	@RequestMapping("/new")
	public String showNewForm(Model model) {

		Employees employee = new Employees();
		model.addAttribute("employee", employee);
		return "add_employee";
	}

	
	@RequestMapping("/newAddress")
	public String showNewAddressForm(Model model) {

		Addresses address = new Addresses();
		model.addAttribute("address", address);
		return "add_address";
	}
	
	@RequestMapping("/newFactory")
	public String showNewFactoryForm(Model model) {

		Factories factory= new Factories();
		model.addAttribute("factory", factory);
		return "add_factory";
	}
	
	
	@RequestMapping("/newPosition")
	public String showNewpostitionForm(Model model) {

		Positions position = new Positions();
		model.addAttribute("position", position);
		return "add_position";
	}
	
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("employee") Employees employee) {
		
		dao.save(employee);
		return "redirect:/";
	}

	@RequestMapping(value = "/saveAddress", method = RequestMethod.POST)
	public String save(@ModelAttribute("address") Addresses address) {

		daoAddr.save(address);
		return "redirect:/addresses";
	}
	
	@RequestMapping(value = "/saveFactory", method = RequestMethod.POST)
	public String save(@ModelAttribute("factory") Factories factory) {

		daoFact.save(factory);
		return "redirect:/factories";
	}
	
	@RequestMapping(value = "/savePosition", method = RequestMethod.POST)
	public String save(@ModelAttribute("position") Positions position) {
		
		if(position.getNazwa_stanowiska().equals("") || position.getOpis_stanowiska().equals(""))
			return "redirect:/newPosition";
		else {
		daoPos.save(position);
		return "redirect:/positions";
		}
	}
	
	@RequestMapping("/edit/{id_pracownika}")
	public ModelAndView showEditForm(@PathVariable(name = "id_pracownika") int id_pracownika) {

		ModelAndView nav = new ModelAndView("edit_form");
		Employees employee = dao.get(id_pracownika);
		nav.addObject("employee", employee);

		return nav;

	}

	@RequestMapping("/editAddress/{id_adresu}")
	public ModelAndView showEditAddressForm(@PathVariable(name = "id_adresu") int id_adresu) {

		ModelAndView nav = new ModelAndView("edit_address_form");
		Addresses address = daoAddr.get(id_adresu);
		nav.addObject("address", address);

		return nav;

	}
	
	@RequestMapping("/editPosition/{id_position}")
	public ModelAndView showEditPositionForm(@PathVariable(name = "id_position") int id_position) {

		ModelAndView nav = new ModelAndView("edit_position_form");
		Positions position = daoPos.get(id_position);
		nav.addObject("position", position);

		return nav;

	}
	
	@RequestMapping("/editFactory/{id_fabryki}")
	public ModelAndView showEditFactoryForm(@PathVariable(name = "id_fabryki") int id_fabryki) {

		ModelAndView nav = new ModelAndView("edit_factory_form");
		Factories factory = daoFact.get(id_fabryki);
		nav.addObject("factory", factory);

		return nav;

	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@ModelAttribute("employee") Employees employee) {

		dao.update(employee);
		return "redirect:/";
	}

	@RequestMapping(value = "/updateAddress", method = RequestMethod.POST)
	public String updateAddress(@ModelAttribute("address") Addresses address) {

		daoAddr.update(address);
		return "redirect:/addresses";
	}
	
	@RequestMapping(value = "/updatePosition", method = RequestMethod.POST)
	public String updatePosition(@ModelAttribute("position") Positions position) {

		daoPos.update(position);
		return "redirect:/positions";
	}
	
	@RequestMapping(value = "/updateFactory", method = RequestMethod.POST)
	public String updateFactory(@ModelAttribute("factory") Factories factory) {

		daoFact.update(factory);
		return "redirect:/factories";
	}
	
	@RequestMapping("/delete/{id_pracownika}")
	public String delete(@PathVariable(name = "id_pracownika") int id_pracownika) {

		dao.delete(id_pracownika);
		return "redirect:/";
	}

	@RequestMapping("/deleteAddress/{id_adresu}")
	public String deleteAddress(@PathVariable(name = "id_adresu") int id_adresu) {

		daoAddr.delete(id_adresu);
		return "redirect:/addresses";
	}
	
	@RequestMapping("/deletePosition/{id_stanowiska}")
	public String deletePosition(@PathVariable(name = "id_stanowiska") int id_stanowiska) {

		daoPos.delete(id_stanowiska);
		return "redirect:/positions";
	}
	
	@RequestMapping("/deleteFactory/{id_fabryki}")
	public String deleteFactory(@PathVariable(name = "id_fabryki") int id_fabryki) {

		daoFact.delete(id_fabryki);
		return "redirect:/factories";
	}
	
	
	//KOD BARTKA
//		@RequestMapping("/user")
//		public String user() {
//			return "in_user";
//		}
//		@RequestMapping("/admin")
//		public String admin() {
//			return "in_admin";
//		}
	
	
}

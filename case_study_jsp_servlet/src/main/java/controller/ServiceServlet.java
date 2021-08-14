package controller;

import model.bean.Customer;
import model.bean.Service;
import model.repository.IServiceRepository;
import model.service.IServiceService;
import model.service.impl.ServiceService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceServlet", urlPatterns = "/services")
public class ServiceServlet extends HttpServlet {

    IServiceService serviceService = new ServiceService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            default:
                listCustomers(request, response);
                break;
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));
        String serviceName= request.getParameter("serviceName");
        double serviceArea= Double.parseDouble(request.getParameter("serviceArea"));
        double serviceCost=Double.parseDouble(request.getParameter("serviceCost"));
        int serviceMaxPeople= Integer.parseInt(request.getParameter("serviceMaxPeople"));
        int rentTypeId=Integer.parseInt(request.getParameter("rentTypeId"));
        int serviceTypeId= Integer.parseInt(request.getParameter("serviceTypeId"));
        String standardRoom= request.getParameter("standardRoom");
        String descriptionOtherConvenience= request.getParameter("descriptionOtherConvenience");
        double pollArea= Double.parseDouble(request.getParameter("pollArea"));
        int numberOfFloors= Integer.parseInt(request.getParameter("numberOfFloors"));
        Service service = new Service(serviceId,serviceName,serviceArea,serviceCost,serviceMaxPeople,rentTypeId,serviceTypeId,standardRoom,descriptionOtherConvenience,pollArea,numberOfFloors);
        serviceService.update(serviceId,service);
        List<Service> services = serviceService.findAll();
        request.setAttribute("services" , services);
        request.setAttribute("messager","Service id = "+serviceId + " was edit");
        try {
            request.getRequestDispatcher("service/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));
        String serviceName= request.getParameter("serviceName");
        double serviceArea= Double.parseDouble(request.getParameter("serviceArea"));
        double serviceCost=Double.parseDouble(request.getParameter("serviceCost"));
        int serviceMaxPeople= Integer.parseInt(request.getParameter("serviceMaxPeople"));
        int rentTypeId=Integer.parseInt(request.getParameter("rentTypeId"));
        int serviceTypeId= Integer.parseInt(request.getParameter("serviceTypeId"));
        String standardRoom= request.getParameter("standardRoom");
        String descriptionOtherConvenience= request.getParameter("descriptionOtherConvenience");
        double pollArea= Double.parseDouble(request.getParameter("pollArea"));
        int numberOfFloors= Integer.parseInt(request.getParameter("numberOfFloors"));

        Service service = new Service(serviceId,serviceName,serviceArea,serviceCost,serviceMaxPeople,rentTypeId,serviceTypeId,standardRoom,descriptionOtherConvenience,pollArea,numberOfFloors);
        serviceService.save(service);
        List<Service> services = serviceService.findAll();
        request.setAttribute("services" , services);
        request.setAttribute("messager","New Service was created");
        try {
            request.getRequestDispatcher("service/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                Delete(request, response);
                break;
            case "view":
                viewCustomer(request, response);
                break;
            case "search":
                searchCustomer(request, response);
                break;
            case "order":
                oderByName(request, response);
                break;
            default:
                listCustomers(request, response);
                break;
        }
    }

    private void listCustomers(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("services", this.serviceService.findAll());
        try {
            request.getRequestDispatcher("service/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void oderByName(HttpServletRequest request, HttpServletResponse response) {
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
    }

    private void viewCustomer(HttpServletRequest request, HttpServletResponse response) {
    }

    private void Delete(HttpServletRequest request, HttpServletResponse response) {
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));
        serviceService.remove(serviceId);
        try {
            response.sendRedirect("/services");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));
        request.setAttribute("service" , serviceService.findById(serviceId));
        try {
            request.getRequestDispatcher("service/edit.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("service/create.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

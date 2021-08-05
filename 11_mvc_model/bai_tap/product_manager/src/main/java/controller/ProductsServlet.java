package controller;

import model.bean.Product;
import model.service.IProductService;
import model.service.impl.ProductService;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@javax.servlet.annotation.WebServlet(name = "ProductsServlet" , urlPatterns = "/products")
public class ProductsServlet extends javax.servlet.http.HttpServlet {

private IProductService productService = new ProductService();

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            default:
                break;
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.remove(id);
        try {
            response.sendRedirect("/products");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        Product product = this.productService.findById(id);

        if(product == null){
            try {
                response.sendRedirect("eror.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            product.setName(name);
            product.setPrice(price);

            productService.update(id, product);
            request.setAttribute("customer", product);
            request.setAttribute("message", "Customer information was updated");
            try {
                request.getRequestDispatcher("customer/edit.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        int id =Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));

        Product product = new Product( id, name,price);
        productService.save(product);

        request.setAttribute("message" , "New product was created");
        try {
            request.getRequestDispatcher("product/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                viewProduct(request, response);
                break;
            default:
                listProducts(request, response);
                break;
        }
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);

        request.setAttribute("customer", product);
        try {
            request.getRequestDispatcher("customer/delete.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        if(product == null){
            try {
                response.sendRedirect("/eror.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("product", product);
            try {
                request.getRequestDispatcher("customer/edit.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("product/create.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) {
        List<Product>products =productService.findAll();
        request.setAttribute("products", products);
        try {
            request.getRequestDispatcher("product/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

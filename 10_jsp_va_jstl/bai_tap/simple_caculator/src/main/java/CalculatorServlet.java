import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet" , urlPatterns = "/calculator" )
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Caculator caculator = new Caculator();

        float firstOperand = Float.parseFloat(request.getParameter("first_operand"));
        float secondOperand = Float.parseFloat(request.getParameter("second_operand"));
        String operator = request.getParameter("operator");

        caculator.setFirstOperand(firstOperand);
        caculator.setSecondOperand(secondOperand);
        caculator.setOperator(operator);

       float result = caculator.Calculate();

       request.setAttribute("result" , result);
       request.getRequestDispatcher("/converter.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

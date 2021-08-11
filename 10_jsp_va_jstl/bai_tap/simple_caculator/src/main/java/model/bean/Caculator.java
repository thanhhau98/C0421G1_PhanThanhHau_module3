package model.bean;

public class Caculator {
     private float FirstOperand ;
     private  float SecondOperand ;
     private  String operator ;

    public Caculator() {
    }

    public Caculator(float firstOperand, float secondOperand, String operator) {
        FirstOperand = firstOperand;
        SecondOperand = secondOperand;
        this.operator = operator;
    }

    public float getFirstOperand() {
        return FirstOperand;
    }

    public void setFirstOperand(float firstOperand) {
        FirstOperand = firstOperand;
    }

    public float getSecondOperand() {
        return SecondOperand;
    }

    public void setSecondOperand(float secondOperand) {
        SecondOperand = secondOperand;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public float Calculate() {
        float result = 0 ;
        switch (operator) {
            case "1":
                result= FirstOperand+ SecondOperand;
                break;
            case "2":
                result= FirstOperand- SecondOperand;
                break;
            case "3":
                result= FirstOperand* SecondOperand;
                break;
            case "4":
                result= FirstOperand/ SecondOperand;
                break;
        }
        return result;
    }
}

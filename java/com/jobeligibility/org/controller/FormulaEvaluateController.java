package com.jobeligibility.org.controller;

import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Deque;
import java.util.HashMap;
import java.util.List;
import java.util.Stack;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.jobeligibility.org.model.*;
import com.jobeligibility.org.repository.*;

public class FormulaEvaluateController {
	String name;
	String post;
	String formula;
	String finalformula = new String();

	public FormulaEvaluateController(String name, String post) {
		this.name = name;
		this.post = post;
	}

	public Boolean resultEvaluate(String expression) throws SQLException {
		this.formula = expression;
		EmployeeRepository er = new EmployeeRepository();
		Employee em = er.getEmployeeByName(name);
		System.out.println(normalizeFormula(expression));
		finalformula = normalizeFormula(expression);

		EligibilityConditionRepository ecr = new EligibilityConditionRepository();
		EligibilityCondition ec = new EligibilityCondition();
		List<EligibilityCondition> listofec = ecr.getEligibilitycriteria(post);
		HashMap<Integer,Integer> map = new HashMap<Integer,Integer>();
		Vector<String> vec = new Vector<String>();
		Pattern p = Pattern.compile("\\d+");
        Matcher m = p.matcher(finalformula);
        while(m.find()) {
        	vec.add(m.group());
        }
        Collections.sort(vec);
		for (EligibilityCondition eligibilityCondition : listofec) {
			try {
				int sno = eligibilityCondition.getSno();
				String s_sno = Integer.toString(sno);
				if(vec.contains(s_sno)){
					int b = evaluateParameter(em, eligibilityCondition);
					map.put(sno, b);
					int temp = map.get(sno);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println(e);
			}
		}
		System.out.println(map);
		finalformula = replacenumberswithresult(finalformula, map);
		System.out.println("replaced formula  " + finalformula);
		System.out.println("solved answer  "+ solveequation(finalformula));
		
		if(solveequation(finalformula) == 1) {
			return true;
		}
		else return false;
	}
	
	private String replacenumberswithresult(String finalformula, HashMap map) {
		int sno;
		Pattern p = Pattern.compile("\\d+");
		Matcher m = p.matcher(finalformula);
		while (m.find()) {
			String val = m.group();
			sno = Integer.parseInt(val);
			int result = (int) map.get(sno);
			finalformula = finalformula.replace(val, String.valueOf(result));
		}
		return finalformula;
	}

	public static int solveequation(String expression) {
		char[] tokens = expression.toCharArray();
		Stack<Integer> values = new Stack<Integer>();
		Stack<Character> ops = new Stack<Character>();

		for (int i = 0; i < tokens.length; i++) {

			if (tokens[i] >= '0' && tokens[i] <= '9') {
				StringBuffer sbuf = new StringBuffer();
				
				while (i < tokens.length && tokens[i] >= '0' && tokens[i] <= '9')
					sbuf.append(tokens[i++]);
				values.push(Integer.parseInt(sbuf.toString()));

				i--;
			}

			else if (tokens[i] == '(')
				ops.push(tokens[i]);

			else if (tokens[i] == ')') {
				while (ops.peek() != '(')
					values.push(applyOp(ops.pop(), values.pop(), values.pop()));
				ops.pop();
			}

			// Current token is an operator.
			else if (tokens[i] == '+' || tokens[i] == '-' || tokens[i] == '*' || tokens[i] == '/') {
				while (!ops.empty() && hasPrecedence(tokens[i], ops.peek()))
					values.push(applyOp(ops.pop(), values.pop(), values.pop()));
				
				ops.push(tokens[i]);
			}
		}

		while (!ops.empty())
			values.push(applyOp(ops.pop(), values.pop(), values.pop()));

		return values.pop();
	}


	public static boolean hasPrecedence(char op1, char op2) {
		if (op2 == '(' || op2 == ')')
			return false;
		if ((op1 == '*' || op1 == '/') && (op2 == '+' || op2 == '-'))
			return false;
		else
			return true;
	}
	public static int applyOp(char op, int b, int a) {
		switch (op) {
		case '+':
			if(a == 1 && b==1) {
				return 1;
			}
			return a + b;
		case '*':
			return a * b;
		}
		return 0;
	}

	public String normalizeFormula(String formula) {
		formula = formula.replaceAll("\\s", "");
		String withoutandformula = formula.replaceAll("(?i)AND", "*");
		String normalizedformula = withoutandformula.replaceAll("(?i)OR", "+");
		if (!formulaValidation(normalizedformula)) {
			System.out.println("invalid statement");
			return null;
		} else
			return normalizedformula;
	}

	public boolean formulaValidation(String formula) {
		if (formula.startsWith(formula, '*') || formula.startsWith(formula, '+') || formula.endsWith("+")
				|| formula.endsWith("*")) {
			System.out.println("Formula must not start or end with opertors");
			return false;
		}
		if (formula.contains("**") || formula.contains("++") || formula.contains("*+") || formula.contains("+*")) {
			return false;
		}
		if (!checkBracket(formula)) {
			System.out.println("Brackets are not balanced");
			return false;
		} else
			return true;
	}

	private boolean checkBracket(String formula) {
		Deque<Character> stack = new ArrayDeque<Character>();

		// Traversing the Expression
		for (int i = 0; i < formula.length(); i++) {
			char x = formula.charAt(i);

			if (x == '(' || x == '[' || x == '{') {
				// Push the element in the stack
				stack.push(x);
				continue;
			}
			char check;
			switch (x) {
			case ')':
				check = stack.pop();
				if (check == '{' || check == '[')
					return false;
				break;

			case '}':
				check = stack.pop();
				if (check == '(' || check == '[')
					return false;
				break;

			case ']':
				check = stack.pop();
				if (check == '(' || check == '{')
					return false;
				break;
			}
		}

		return true;
	}

	public int evaluateParameter(Employee em, EligibilityCondition condition) throws Exception, RuntimeException {

		String field = condition.getField();
		var value = condition.getValue();
		System.out.println("my field name is: " + field);
		String methodName = "get" + field;
		Class<?> classObj = em.getClass();
		Method getterMethod = classObj.getDeclaredMethod(methodName, null);
		var v = getterMethod.invoke(em);
		String operator = condition.getOperator();
		if (v instanceof String) {
			if (((String) v).contains(value)) {
				System.out.println("true");
//				map.put(intformap, 1);
//				intformap++;
				return 1;
			} else {
				System.out.println("false");
				return 0;
			}

		}
		if (v instanceof Integer) {
			String vstring = String.valueOf(v);
			int empObj = Integer.parseInt(vstring);
			// System.out.println(empObj);
			int fieldvalue = Integer.parseInt(value);
			// System.out.println(fieldvalue);
			if (operator.equals(">")) {
				if (empObj > fieldvalue) {
					System.out.println("true");
					return 1;
				} else {
					System.out.println("false");
					return 0;
				}
			}
			if (operator.equals("<")) {
				if (empObj < fieldvalue) {
					System.out.println("true");
					return 1;
				} else {
					System.out.println("false");
					return 0;
				}
			}
			if (operator.equals("=")) {
				if (empObj == fieldvalue) {
					System.out.println("true");
					return 1;
				} else {
					System.out.println("false");
					return 0;
				}
			}
		}

		return 0;
	}

}
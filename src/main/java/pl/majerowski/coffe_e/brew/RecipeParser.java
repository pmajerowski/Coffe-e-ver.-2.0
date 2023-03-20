package pl.majerowski.coffe_e.brew;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RecipeParser {
    private static final Pattern EXPR_RE = Pattern.compile("\\G\\s*([+-]?)\\s*([^+-]+)"),
            TERM_RE = Pattern.compile("\\G(^|(?<!^)\\*|(?<!^)/)\\s*(\\d*\\.?\\d+)\\s*");

    public static double calculate(String expr) {
        Matcher m = EXPR_RE.matcher(expr);
        double sum = 0;
        int matchEnd;
        for (matchEnd = -1; m.find(); matchEnd = m.end()) {
            sum += (("-".equals(m.group(1))) ? -1 : +1) * evalTerm(m.group(2));
        }
        if (matchEnd != expr.length()) {
            throw new IllegalArgumentException("Invalid expression \"" + expr + "\"");
        }
        return sum;
    }

    private static double evalTerm(String term) {
        Matcher m = TERM_RE.matcher(term);
        double product = Double.NaN;
        int matchEnd;
        for (matchEnd = -1; m.find(); matchEnd = m.end()) {
            switch (m.group(1)) {
                case "*":
                    product *= Double.parseDouble(m.group(2));
                    break;
                case "/":
                    product /= Double.parseDouble(m.group(2));
                    break;
                case "":
                    product = Double.parseDouble(m.group(2));
                    break;
            }
        }
        if (matchEnd != term.length()) {
            throw new IllegalArgumentException("Invalid term \"" + term + "\"");
        }
        return product;
    }

    public static String parseRecipe(String recipe, double desiredAmount, double coffeeGrounds) {
        while (recipe.contains("${")) {
            String recipeSubstring = recipe.substring(recipe.indexOf("${") + 1, recipe.indexOf("}") + 1);

            if (recipeSubstring.contains("desiredAmount")) {
                String replaced = recipeSubstring.substring(1, recipeSubstring.length() - 1)
                        .replace("desiredAmount", String.valueOf(desiredAmount));
                Double result = Math.floor(RecipeParser.calculate(replaced));

                recipe = recipe.replace("$" + recipeSubstring, String.valueOf(result));

            } else if (recipeSubstring.contains("coffeeGrounds")) {
                String replaced = recipeSubstring.substring(1, recipeSubstring.length() - 1)
                        .replace("coffeeGrounds", String.valueOf(coffeeGrounds));
                Double result = Math.floor(RecipeParser.calculate(replaced));

                recipe = recipe.replace("$" + recipeSubstring, String.valueOf(result));

            } else {
                break;
            }
        }
        return recipe;
    }
}
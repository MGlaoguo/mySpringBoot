package utils;

/**
 * @author guojiabin
 */
public class StringUtil {
    /**
     *
     * @param object object
     * @return boolean
     */
    public static boolean isBlank(Object object){
        if (object == null) {
            return true;
        }
        if(object instanceof String){
            CharSequence cs = (CharSequence) object;
            int strLen;
            if ((strLen = cs.length()) != 0) {
                for(int i = 0; i < strLen; ++i) {
                    if (!Character.isWhitespace(cs.charAt(i))) {
                        return false;
                    }
                }
                return true;
            } else {
                return true;
            }
        }
        return true;
    }
    public static boolean isNotBlank(Object object){
        return !isBlank(object);
    }

    public static void main(String[] args) {
        String a="                    ";
        char c = ' ';
        System.out.println(isBlank(a));
        System.out.println(isNotBlank(a));
        System.out.println(isBlank(c));
        System.out.println(isNotBlank(c));

    }
}

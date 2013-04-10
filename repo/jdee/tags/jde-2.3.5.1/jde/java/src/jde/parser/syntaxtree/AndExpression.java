//
// Generated by JTB 1.1.2
//

package jde.parser.syntaxtree;

/**
 * Grammar production:
 * <PRE>
 * f0 -> EqualityExpression()
 * f1 -> ( "&" EqualityExpression() )*
 * </PRE>
 */
public class AndExpression implements Node {
   public EqualityExpression f0;
   public NodeListOptional f1;

   public AndExpression(EqualityExpression n0, NodeListOptional n1) {
      f0 = n0;
      f1 = n1;
   }

   public void accept(jde.parser.visitor.Visitor v) {
      v.visit(this);
   }
}


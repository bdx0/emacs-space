//
// Generated by JTB 1.1.2
//

package jde.parser.syntaxtree;

/**
 * Grammar production:
 * <PRE>
 * f0 -> ConditionalOrExpression()
 * f1 -> [ "?" Expression() ":" ConditionalExpression() ]
 * </PRE>
 */
public class ConditionalExpression implements Node {
   public ConditionalOrExpression f0;
   public NodeOptional f1;

   public ConditionalExpression(ConditionalOrExpression n0, NodeOptional n1) {
      f0 = n0;
      f1 = n1;
   }

   public void accept(jde.parser.visitor.Visitor v) {
      v.visit(this);
   }
}


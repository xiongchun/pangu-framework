package org.g4studio.core.mvc.xstruts.validator.validwhen;

public interface ValidWhenParserTokenTypes {
	int EOF = 1;
	int NULL_TREE_LOOKAHEAD = 3;
	int DECIMAL_LITERAL = 4;
	int HEX_LITERAL = 5;
	int OCTAL_LITERAL = 6;
	int STRING_LITERAL = 7;
	int IDENTIFIER = 8;
	int LBRACKET = 9;
	int RBRACKET = 10;
	int LITERAL_null = 11;
	int THIS = 12;
	int LPAREN = 13;
	int RPAREN = 14;
	int ANDSIGN = 15;
	int ORSIGN = 16;
	int EQUALSIGN = 17;
	int GREATERTHANSIGN = 18;
	int GREATEREQUALSIGN = 19;
	int LESSTHANSIGN = 20;
	int LESSEQUALSIGN = 21;
	int NOTEQUALSIGN = 22;
	int WS = 23;
}

/**
 * @description 
 */
public virtual with sharing class Debugger implements Debugger.Printable {
	/*
	██████╗██╗  ██╗ █████╗██████╗██████╗ ██████╗██╗ █████╗ ███╗   ██╗██████╗
	██╔═══╝╚██╗██╔╝██╔═══╝██╔═══╝██╔══██╗╚═██╔═╝██║██╔══██╗████╗  ██║██╔═══╝
	████╗   ╚███╔╝ ██║    ████╗  ██████╔╝  ██║  ██║██║  ██║██╔██╗ ██║██████╗
	██╔═╝   ██╔██╗ ██║    ██╔═╝  ██╔═══╝   ██║  ██║██║  ██║██║╚██╗██║╚═══██║
	██████╗██╔╝ ██╗╚█████╗██████╗██║       ██║  ██║╚█████╔╝██║ ╚████║██████║
	╚═════╝╚═╝  ╚═╝ ╚════╝╚═════╝╚═╝       ╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═══╝╚═════╝
	*/
	public with sharing class UnknownException extends Exception {}
	public with sharing class InvalidTabsToIndentException extends Exception {}

	/*
	██████╗ █████╗ ██╗███╗   ██╗██████╗ █████╗ ██████╗ ██╗    ██████╗
	██╔══██╗██╔═██╗██║████╗  ██║╚═██╔═╝██╔══██╗██╔══██╗██║    ██╔═══╝
	██████╔╝█████╔╝██║██╔██╗ ██║  ██║  ███████║██████╔╝██║    ████╗  
	██╔═══╝ ██╔═██╗██║██║╚██╗██║  ██║  ██╔══██║██╔══██╗██║    ██╔═╝  
	██║     ██║ ██║██║██║ ╚████║  ██║  ██║  ██║██████╔╝██████╗██████╗
	╚═╝     ╚═╝ ╚═╝╚═╝╚═╝  ╚═══╝  ╚═╝  ╚═╝  ╚═╝╚═════╝ ╚═════╝╚═════╝
	*/
	public interface Printable {
		String getDebug(Integer tabsToIndent);
		String getHtmlDebug();
	}

	/*
	██╗███╗   ██╗██████╗██████╗ █████╗ ███╗   ██╗ █████╗██████╗
	██║████╗  ██║██╔═══╝╚═██╔═╝██╔══██╗████╗  ██║██╔═══╝██╔═══╝
	██║██╔██╗ ██║██████╗  ██║  ███████║██╔██╗ ██║██║    ████╗  
	██║██║╚██╗██║╚═══██║  ██║  ██╔══██║██║╚██╗██║██║    ██╔═╝  
	██║██║ ╚████║██████║  ██║  ██║  ██║██║ ╚████║╚█████╗██████╗
	╚═╝╚═╝  ╚═══╝╚═════╝  ╚═╝  ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚════╝╚═════╝
	*/
	@TestVisible final String t;
	@TestVisible final Printable[] p;

	public Debugger(String title) {
		this.t = title;
		this.p = new Printable[] {};
	}

	public String getTitle() {
		return this.t == null ? 'Debug' : this.t;
	}

	public Printable[] getPrintables() {
		return this.p;
	}

	public Boolean isEmpty() {
		return this.getPrintables().isEmpty();
	}

	public Integer size() {
		return this.getPrintables().size();
	}

	public Debugger clear() {
		this.getPrintables().clear();
		return this;
	}

	public Debugger add(String label, Object value) {
		Printable printable = getPrintable(label, value);
		if(printable != null) {
			this.getPrintables().add(printable);
		}
		return this;
	}

	public Debugger add(Exception e) {
		return this.add(
			e == null ? 'Exception' : e.getTypeName(), 
			e
		);
	}

	public Debugger add(Printable printable) {
		if(printable != null) {
			this.getPrintables().add(printable);
		}
		return this;
	}

	// Debugger.Printable
	public Integer getBorderLength() {
		return this.getTitle().length() + (2 * this.getBorderPadding());
	}

	public String[] getTitles(Integer tabsToIndent) {
		assertTabsToIndentIsValid(tabsToIndent);
		final Integer borderLength = this.getBorderLength();
		return new String[] {
			'',
			'\t'.repeat(tabsToIndent + 1) + this.getBorderCharacter().repeat(borderLength),
			String.join(
				new String[] {
				'\t'.repeat(tabsToIndent + 1),
				this.getTitle(),
				''
				}, 
				' '.repeat(this.getBorderPadding())
			),
			'\t'.repeat(tabsToIndent + 1) + this.getBorderCharacter().repeat(borderLength)
		};
	}

	public String getDebug(Integer tabsToIndent) {
		assertTabsToIndentIsValid(tabsToIndent);

		String[] debugs = new String[] {};

		// Pad top
		debugs.add('');
		
		// Add title
		debugs.addAll(this.getTitles(tabsToIndent));

		// Add Printables
		for(Printable printable : this.getPrintables()) {
			debugs.add(printable.getDebug(tabsToIndent + 1));
		}

		// Pad bottom
		debugs.add('');

		return String.join(debugs, '\n');
	}

	public String getHtmlDebug() {
		String[] debugs = new String[] {
			String.join(
				new String[] {
					'<' + this.getHtmlHeader() + '>', 
						this.getTitle(), 
					'</' + this.getHtmlHeader() + '>'
				}, 
				''
			)
		};

		debugs.add('<ul>');
		for(Printable printable : this.getPrintables()) {
			debugs.add('<li>' + printable.getHtmlDebug() + '</li>');
		}
		debugs.add('</ul>');

		return String.join(debugs, '');
	}

	public override String toString() {
		return this.getDebug(0);
	}

	public Debugger debug() {
		System.debug(System.LoggingLevel.ERROR, this.toString());
		return this;
	}

	// Virtual
	public virtual String getBorderCharacter() {
		return '=';
	}
	
	public virtual Integer getBorderPadding() {
		return 3;
	}

	public virtual String getHtmlHeader() {
		return 'h2';
	}

	public virtual Boolean equals(Object that) {
		return that instanceof Debugger && this.toString().equals(((Debugger) that).toString());
	}

	public virtual Integer hashCode() {
		return this.toString().hashCode();
	}

	/*
	██████╗██████╗██████╗██████╗██╗███╗   ██╗ █████╗ 
	╚═██╔═╝██╔═══╝██╔═══╝╚═██╔═╝██║████╗  ██║██╔═══╝ 
	  ██║  ████╗  ██████╗  ██║  ██║██╔██╗ ██║██║ ███╗
	  ██║  ██╔═╝  ╚═══██║  ██║  ██║██║╚██╗██║██║  ██║
	  ██║  ██████╗██████║  ██║  ██║██║ ╚████║╚█████╔╝
	  ╚═╝  ╚═════╝╚═════╝  ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚════╝ 
	*/
	/*
	██╗  ██╗██████╗██╗██╗    
	██║  ██║╚═██╔═╝██║██║    
	██║  ██║  ██║  ██║██║    
	██║  ██║  ██║  ██║██║    
	╚█████╔╝  ██║  ██║██████╗
	 ╚════╝   ╚═╝  ╚═╝╚═════╝
	*/
	public void throwException(Exception e) {
		Exception ex = e == null ? new UnknownException() : e;
		ex.setMessage(this.toString());
		throw ex;
	}

	public void throwException(Type exceptionType) {
		Object newInstance = exceptionType == null ? null : exceptionType.newInstance();
		this.throwException(newInstance instanceof Exception ? (Exception) newInstance : null);
	}

	public void throwException() {
		this.throwException((Exception) null);
	}

	public Debugger assertEquals(Object expected, Object actual, String title) {
		this.add(new Tab(title == null ? 'Assert Equals' : title)
			.add('expected', expected)
			.add('actual', actual)
		);
		System.assertEquals(expected, actual, this.toString());
		return this;
	}

	public Debugger assertEquals(Object expected, Object actual) {
		return this.assertEquals(expected, actual, (String) null);
	}

	public Debugger assertNotEquals(Object expected, Object actual, String title) {
		this.add(new Tab(title == null ? 'Assert Not Equals' : title)
			.add('expected', expected)
			.add('actual', actual)
		);
		System.assertNotEquals(expected, actual, this.toString());
		return this;
	}

	public Debugger assertNotEquals(Object expected, Object actual) {
		return this.assertNotEquals(expected, actual, (String) null);
	}
	
	/*
	████████╗ █████╗ ██████╗ 
	╚══██╔══╝██╔══██╗██╔══██╗
	   ██║   ███████║██████╔╝
	   ██║   ██╔══██║██╔══██╗
	   ██║   ██║  ██║██████╔╝
	   ╚═╝   ╚═╝  ╚═╝╚═════╝ 
	*/
	public virtual with sharing class Tab extends Debugger {
		
		public Tab(String title) {
			super(title);
		}

		public virtual override String getBorderCharacter() {
			return '-';
		}

		public virtual override String getHtmlHeader() {
			return 'h3';
		}

		public virtual override Boolean equals(Object that) {
			return that instanceof Tab && this.toString().equals(((Tab) that).toString());
		}	
	}

	/*
	██╗  ██╗ █████╗ ██╗    ██╗  ██╗██████╗
	██║  ██║██╔══██╗██║    ██║  ██║██╔═══╝
	██║  ██║███████║██║    ██║  ██║████╗  
	╚██╗██╔╝██╔══██║██║    ██║  ██║██╔═╝  
	 ╚███╔╝ ██║  ██║██████╗╚█████╔╝██████╗
	  ╚══╝  ╚═╝  ╚═╝╚═════╝ ╚════╝ ╚═════╝
	*/
	public with sharing class Value implements Debugger.Printable {
		@TestVisible final String l;
		@TestVisible final Object v;

		public Value(String label, Object value) {
			this.l = label;
			this.v = value;
		}

		public String getLabel() {
			return this.l;
		}

		public Object getValue() {
			return this.v;
		}

		public override String toString() {
			return this.getLabel() + ': ' + this.getValue();
		}

		public Integer hashCode() {
			return this.toString().hashCode();
		}

		public Boolean equals(Object that) {
			return that instanceof Value && this.toString().equals(((Value) that).toString());
		}

		// Debugger.Printable
		public String getDebug(Integer tabsToIndent) {
			assertTabsToIndentIsValid(tabsToIndent);
			return '\t'.repeat(tabsToIndent) + this.toString();
		}

		public String getHtmlDebug() {
			return this.toString();
		}		
	}

	/*
	 █████╗ ██████╗██████╗██████╗█████╗ ██████╗   █████╗ ███╗   ██╗█████╗ 
	██╔══██╗██╔═══╝██╔═══╝██╔═══╝██╔═██╗╚═██╔═╝  ██╔══██╗████╗  ██║██╔═██╗
	███████║██████╗██████╗████╗  █████╔╝  ██║    ███████║██╔██╗ ██║██║ ██║
	██╔══██║╚═══██║╚═══██║██╔═╝  ██╔═██╗  ██║    ██╔══██║██║╚██╗██║██║ ██║
	██║  ██║██████║██████║██████╗██║ ██║  ██║    ██║  ██║██║ ╚████║█████╔╝
	╚═╝  ╚═╝╚═════╝╚═════╝╚═════╝╚═╝ ╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═══╝╚════╝ 
	*/
	/*
	██╗██████╗  ██╗  ██╗ █████╗ ██╗    ██╗█████╗ 
	██║██╔═══╝  ██║  ██║██╔══██╗██║    ██║██╔═██╗
	██║██████╗  ██║  ██║███████║██║    ██║██║ ██║
	██║╚═══██║  ╚██╗██╔╝██╔══██║██║    ██║██║ ██║
	██║██████║   ╚███╔╝ ██║  ██║██████╗██║█████╔╝
	╚═╝╚═════╝    ╚══╝  ╚═╝  ╚═╝╚═════╝╚═╝╚════╝ 
	*/
	/*
	██████╗ █████╗ ██████╗ ██████╗  ██████╗ █████╗   
	╚═██╔═╝██╔══██╗██╔══██╗██╔═══╝  ╚═██╔═╝██╔══██╗  
	  ██║  ███████║██████╔╝██████╗    ██║  ██║  ██║  
	  ██║  ██╔══██║██╔══██╗╚═══██║    ██║  ██║  ██║  
	  ██║  ██║  ██║██████╔╝██████║    ██║  ╚█████╔╝  
	  ╚═╝  ╚═╝  ╚═╝╚═════╝ ╚═════╝    ╚═╝   ╚════╝   
	*/
	/*
	██╗███╗   ██╗█████╗ ██████╗███╗   ██╗██████╗
	██║████╗  ██║██╔═██╗██╔═══╝████╗  ██║╚═██╔═╝
	██║██╔██╗ ██║██║ ██║████╗  ██╔██╗ ██║  ██║  
	██║██║╚██╗██║██║ ██║██╔═╝  ██║╚██╗██║  ██║  
	██║██║ ╚████║█████╔╝██████╗██║ ╚████║  ██║  
	╚═╝╚═╝  ╚═══╝╚════╝ ╚═════╝╚═╝  ╚═══╝  ╚═╝  
	*/
	public static Boolean isTabsToIndentValid(Integer tabsToIndent) {
		return tabsToIndent != null && 0 <= tabsToIndent;
	}

	public static void assertTabsToIndentIsValid(Integer tabsToIndent) {
		if(!isTabsToIndentValid(tabsToIndent)) {
			throw new InvalidTabsToIndentException(System.Label.Debugger_InvalidTabsToIndentException);
		}
	}

	/*
	█████╗ ██████╗██████╗ ██╗  ██╗ █████╗ 
	██╔═██╗██╔═══╝██╔══██╗██║  ██║██╔═══╝ 
	██║ ██║████╗  ██████╔╝██║  ██║██║ ███╗
	██║ ██║██╔═╝  ██╔══██╗██║  ██║██║  ██║
	█████╔╝██████╗██████╔╝╚█████╔╝╚█████╔╝
	╚════╝ ╚═════╝╚═════╝  ╚════╝  ╚════╝ 
	*/
	public static Map<String, Object> debug(Exception e) {
		if(e == null) {
			return null;
		}
		return new Map<String, Object> {
			System.Label.Exception_Type_Name => e.getTypeName(), 
			System.Label.Exception_Message => e.getMessage(), 
			System.Label.Exception_Line_Number => e.getLineNumber(), 
			System.Label.Exception_Stack_Trace => String.isBlank(e.getStackTraceString()) ? null : e.getStackTraceString().split('\n'), 
			System.Label.Exception_Cause => e.getCause()
		};
	}

	public static Map<String, Object> debug(SObject record) {
		if(record == null) {
			return null;
		}
		return record.getPopulatedFieldsAsMap();
	}

	public static Map<String, Object> debug(Object[] objects) {
		if(objects == null) {
			return null;
		}
		Map<String, Object> debug = new Map<String, Object>();
		Integer i = 0;
		for(Object obj : objects) {
			debug.put('#' + (i ++), obj);
		}
		return debug;
	}

	public static Map<String, Object> debug(Set<Id> ids) {
		if(ids == null) {
			return null;
		}
		return debug(new List<Id>(ids));
	}

	public static Map<String, Object> debug(Set<String> strings) {
		if(strings == null) {
			return null;
		}
		return debug(new List<String>(strings));
	}

	public static Map<String, Object> debug(Object value) {
		if(value == null) {
			return null;
		}
		else if(value instanceof Map<String, Object>) {
			return (Map<String, Object>) value;
		}
		else if(value instanceof Debuggable) {
			return ((Debuggable) value).debug();
		}
		else if(value instanceof Exception) {
			return debug((Exception) value);
		}
		else if(!(value instanceof SObject[]) && value instanceof SObject) {
			return debug((SObject) value);
		}
		else if(value instanceof Object[]) {
			return debug((Object[]) value);
		}
		else if(value instanceof Set<Id>) {
			return debug((Set<Id>) value);
		}
		else if(value instanceof Set<String>) {
			return debug((Set<String>) value);
		}
		return null;
	}

	/*
	 █████╗ ██████╗██████╗
	██╔═══╝ ██╔═══╝╚═██╔═╝
	██║ ███╗████╗    ██║  
	██║  ██║██╔═╝    ██║  
	╚█████╔╝██████╗  ██║  
	 ╚════╝ ╚═════╝  ╚═╝  
	*/
	/*
	██████╗ █████╗ ██╗███╗   ██╗██████╗ █████╗ ██████╗ ██╗    ██████╗
	██╔══██╗██╔═██╗██║████╗  ██║╚═██╔═╝██╔══██╗██╔══██╗██║    ██╔═══╝
	██████╔╝█████╔╝██║██╔██╗ ██║  ██║  ███████║██████╔╝██║    ████╗  
	██╔═══╝ ██╔═██╗██║██║╚██╗██║  ██║  ██╔══██║██╔══██╗██║    ██╔═╝  
	██║     ██║ ██║██║██║ ╚████║  ██║  ██║  ██║██████╔╝██████╗██████╗
	╚═╝     ╚═╝ ╚═╝╚═╝╚═╝  ╚═══╝  ╚═╝  ╚═╝  ╚═╝╚═════╝ ╚═════╝╚═════╝
	*/
	public static Printable getPrintable(String label, Object value) {
		Map<String, Object> debug = debug(value);
		if(debug != null) {
			return getTab(label, debug);
		}
		return new Value(label, value);
	}

	/*
	 █████╗ ██████╗██████╗
	██╔═══╝ ██╔═══╝╚═██╔═╝
	██║ ███╗████╗    ██║  
	██║  ██║██╔═╝    ██║  
	╚█████╔╝██████╗  ██║  
	 ╚════╝ ╚═════╝  ╚═╝  
	*/
	/*
	██████╗ █████╗ ██████╗ 
	╚═██╔═╝██╔══██╗██╔══██╗
	  ██║  ███████║██████╔╝
	  ██║  ██╔══██║██╔══██╗
	  ██║  ██║  ██║██████╔╝
	  ╚═╝  ╚═╝  ╚═╝╚═════╝ 
	*/
	public static Tab getTab(String title, Map<String, Object> debug) {
		Tab tab = new Tab(title);
		if(debug != null) {
			for(String label : debug.keySet()) {
				tab.add(getPrintable(label, debug.get(label)));   
			}
		}
		return tab;
	}
}
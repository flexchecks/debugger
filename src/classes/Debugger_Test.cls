@IsTest
public with sharing class Debugger_TEST {
	/*
	██████╗██╗  ██╗ █████╗██████╗██████╗ ██████╗██╗ █████╗ ███╗   ██╗██████╗
	██╔═══╝╚██╗██╔╝██╔═══╝██╔═══╝██╔══██╗╚═██╔═╝██║██╔══██╗████╗  ██║██╔═══╝
	████╗   ╚███╔╝ ██║    ████╗  ██████╔╝  ██║  ██║██║  ██║██╔██╗ ██║██████╗
	██╔═╝   ██╔██╗ ██║    ██╔═╝  ██╔═══╝   ██║  ██║██║  ██║██║╚██╗██║╚═══██║
	██████╗██╔╝ ██╗╚█████╗██████╗██║       ██║  ██║╚█████╔╝██║ ╚████║██████║
	╚═════╝╚═╝  ╚═╝ ╚════╝╚═════╝╚═╝       ╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═══╝╚═════╝
	*/
	public with sharing class TestException extends Exception {}

	/*
	██╗███╗   ██╗██████╗██████╗█████╗ ██████╗ █████╗  █████╗██████╗
	██║████╗  ██║╚═██╔═╝██╔═══╝██╔═██╗██╔═══╝██╔══██╗██╔═══╝██╔═══╝
	██║██╔██╗ ██║  ██║  ████╗  █████╔╝████╗  ███████║██║    ████╗  
	██║██║╚██╗██║  ██║  ██╔═╝  ██╔═██╗██╔═╝  ██╔══██║██║    ██╔═╝  
	██║██║ ╚████║  ██║  ██████╗██║ ██║██║    ██║  ██║╚█████╗██████╗
	╚═╝╚═╝  ╚═══╝  ╚═╝  ╚═════╝╚═╝ ╚═╝╚═╝    ╚═╝  ╚═╝ ╚════╝╚═════╝
	*/
	/*
	██████╗ █████╗ ███╗   ███╗██████╗ ██╗    ██████╗
	██╔═══╝██╔══██╗████╗ ████║██╔══██╗██║    ██╔═══╝
	██████╗███████║██╔████╔██║██████╔╝██║    ████╗  
	╚═══██║██╔══██║██║╚██╔╝██║██╔═══╝ ██║    ██╔═╝  
	██████║██║  ██║██║ ╚═╝ ██║██║     ██████╗██████╗
	╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝     ╚═════╝╚═════╝
	*/
	public with sharing class InterfaceSample implements Debugger.Printable, Debuggable {
		final Map<String, Object> debug = new Map<String, Object> {
			'Organization ID' => UserInfo.getOrganizationId(),
			'Organization Name' => UserInfo.getOrganizationName(),
			'Today' => Date.today(),
			'Now' => Datetime.now(),
			'Random Integer' => Crypto.getRandomInteger(),
			'null' => null
		};

		// Debugger.Printable
		public String getDebug(Integer tabsToIndent) {
			return String.valueOf(tabsToIndent);
		}

		public String getHtmlDebug() {
			return this.toString();
		}

		// Debuggabl
		public Map<String, Object> debug() {
			return this.debug;
		}

		public override String toString() {
			return 'This is a custom message.';
		}
	}

	/*
	███╗   ██╗ █████╗ ██████╗
	████╗  ██║██╔══██╗╚═██╔═╝
	██╔██╗ ██║██║  ██║  ██║  
	██║╚██╗██║██║  ██║  ██║  
	██║ ╚████║╚█████╔╝  ██║  
	╚═╝  ╚═══╝ ╚════╝   ╚═╝  
	*/
	/*
	█████╗ ██████╗██████╗ ██╗  ██╗ █████╗  █████╗  █████╗ ██████╗ ██╗    ██████╗
	██╔═██╗██╔═══╝██╔══██╗██║  ██║██╔═══╝ ██╔═══╝ ██╔══██╗██╔══██╗██║    ██╔═══╝
	██║ ██║████╗  ██████╔╝██║  ██║██║ ███╗██║ ███╗███████║██████╔╝██║    ████╗  
	██║ ██║██╔═╝  ██╔══██╗██║  ██║██║  ██║██║  ██║██╔══██║██╔══██╗██║    ██╔═╝  
	█████╔╝██████╗██████╔╝╚█████╔╝╚█████╔╝╚█████╔╝██║  ██║██████╔╝██████╗██████╗
	╚════╝ ╚═════╝╚═════╝  ╚════╝  ╚════╝  ╚════╝ ╚═╝  ╚═╝╚═════╝ ╚═════╝╚═════╝
	*/
	public with sharing class NotDebuggable {}
		
	/*
	██████╗██████╗██████╗██████╗
	╚═██╔═╝██╔═══╝██╔═══╝╚═██╔═╝
	  ██║  ████╗  ██████╗  ██║  
	  ██║  ██╔═╝  ╚═══██║  ██║  
	  ██║  ██████╗██████║  ██║  
	  ╚═╝  ╚═════╝╚═════╝  ╚═╝  
	*/
	/*
	██╗███╗   ██╗██████╗██████╗█████╗ ██████╗ █████╗  █████╗██████╗██████╗
	██║████╗  ██║╚═██╔═╝██╔═══╝██╔═██╗██╔═══╝██╔══██╗██╔═══╝██╔═══╝██╔═══╝
	██║██╔██╗ ██║  ██║  ████╗  █████╔╝████╗  ███████║██║    ████╗  ██████╗
	██║██║╚██╗██║  ██║  ██╔═╝  ██╔═██╗██╔═╝  ██╔══██║██║    ██╔═╝  ╚═══██║
	██║██║ ╚████║  ██║  ██████╗██║ ██║██║    ██║  ██║╚█████╗██████╗██████║
	╚═╝╚═╝  ╚═══╝  ╚═╝  ╚═════╝╚═╝ ╚═╝╚═╝    ╚═╝  ╚═╝ ╚════╝╚═════╝╚═════╝
	*/
	/**
	 * @description Is this test necessary?
	 */
	@IsTest
	public static void testInterfaces() {
		// Data
		final InterfaceSample sample = new InterfaceSample();

		// ----------------------------------  Start Test  ----------------------------------
		Test.startTest();

		// Debugger.Printable
		{
			System.assertEquals(true, (Object) sample instanceof Debugger.Printable);

			// String getDebug(Integer tabsToIndent)
			for(Integer tabsToIndent : new Integer[] {
				null,
				1,
				-45
			}) {
				System.assertEquals(String.valueOf(tabsToIndent), sample.getDebug(tabsToIndent));
			}

			// String getHtmlDebug()
			{
				System.assertEquals(sample.toString(), sample.getHtmlDebug());
			}
		}

		{			
			// Map<String, Object> debug()
			{
				System.assertEquals(true, (Object) sample instanceof Debuggable);
				System.assertEquals(true, sample.debug === sample.debug());
			}
		}

		Test.stopTest();
		// -----------------------------  Stop Test  -----------------------------
	}

	/*
	 █████╗ ██████╗██████╗██████╗█████╗ ██████╗
	██╔══██╗██╔═══╝██╔═══╝██╔═══╝██╔═██╗╚═██╔═╝
	███████║██████╗██████╗████╗  █████╔╝  ██║  
	██╔══██║╚═══██║╚═══██║██╔═╝  ██╔═██╗  ██║  
	██║  ██║██████║██████║██████╗██║ ██║  ██║  
	╚═╝  ╚═╝╚═════╝╚═════╝╚═════╝╚═╝ ╚═╝  ╚═╝  
	*/
	/*
	██╗  ██╗██████╗██╗██╗    
	██║  ██║╚═██╔═╝██║██║    
	██║  ██║  ██║  ██║██║    
	██║  ██║  ██║  ██║██║    
	╚█████╔╝  ██║  ██║██████╗
	 ╚════╝   ╚═╝  ╚═╝╚═════╝
	*/
	public static void assertIsValid(Debugger d) {
		System.assertNotEquals(null, d);

		// String getTitle()
		{
			System.assertEquals(
				d.t == null ? 'Debug' : d.t, 
				d.getTitle()
			);
		}

		// Printable[] getPrintables()
		{
			System.assertEquals(
				true, 
				d.p === d.getPrintables()
			);
		}

		// Boolean isEmpty()
		{
			System.assertEquals(
				d.getPrintables().isEmpty(), 
				d.isEmpty()
			);
		}

		// Integer size()
		{
			System.assertEquals(
				d.getPrintables().size(), 
				d.size()
			);
		}

		// Debugger.Printable
		{
			// Integer getBorderLength()
			{
				System.assertEquals(
					d.getTitle().length() + (2 * d.getBorderPadding()), 
					d.getBorderLength()
				);
			}

			// String getHtmlDebug()
			{
				String[] expectedDebugs = new String[] {};
				{
					expectedDebugs.add(
						String.join(
							new String[] {
								'<' + d.getHtmlHeader() + '>', 
									d.getTitle(), 
								'</' + d.getHtmlHeader() + '>'
							}, 
							''
						)
					);

					expectedDebugs.add('<ul>');
					for(Debugger.Printable printable : d.getPrintables()) {
						expectedDebugs.add('<li>' + printable.getHtmlDebug() + '</li>');
					}
					expectedDebugs.add('</ul>');
				}

				System.assertEquals(
					String.join(expectedDebugs, ''), 
					d.getHtmlDebug()
				);
			}

			// String debug(Integer tabsToIndent)
			for(Integer tabsToIndent : new Integer[] {
				null, 
				-1, 
				0, 
				7
			}) {
				// String[] getTitles(Integer tabsToIndent)
				{
					Exception e;
					String[] titles;

					try {
						titles = d.getTitles(tabsToIndent);
					} catch(Exception whoops) {
						e = whoops;
					}

					if(Debugger.isTabsToIndentValid(tabsToIndent)) {
						System.assertEquals(null, e);

						final String[] expectedTitles = new String[] {};
						{
							final Integer borderLength = d.getBorderLength();
							expectedTitles.addAll(new String[] {
								'',
								'\t'.repeat(tabsToIndent + 1) + d.getBorderCharacter().repeat(borderLength),
								String.join(
									new String[] {
									'\t'.repeat(tabsToIndent + 1),
									d.getTitle(),
									''
									}, 
									' '.repeat(d.getBorderPadding())
								),
								'\t'.repeat(tabsToIndent + 1) + d.getBorderCharacter().repeat(borderLength)
							});

							System.assertEquals(
								expectedTitles, 
								titles
							);
						}
					}
					else {
						System.assertEquals(true, e instanceof Debugger.InvalidTabsToIndentException);
						System.assertEquals(null, titles);
					}
				}

				// String getDebug(Integer tabsToIndent)
				{
					Exception e;
					String debug;

					try {
						debug = d.getDebug(tabsToIndent);
					} catch(Exception whoops) {
						e = whoops;
					}

					if(Debugger.isTabsToIndentValid(tabsToIndent)) {
						System.assertEquals(null, e);

						final String[] expectedDebugs = new String[] {};
						{
							// Pad top
							expectedDebugs.add('');
							
							// Add title
							expectedDebugs.addAll(d.getTitles(tabsToIndent));

							// Add Printables
							for(Debugger.Printable printable : d.getPrintables()) {
								expectedDebugs.add(printable.getDebug(tabsToIndent + 1));
							}

							// Pad bottom
							expectedDebugs.add('');
						}

						System.assertEquals(
							String.join(expectedDebugs, '\n'), 
							debug
						);
					}
					else {
						System.assertEquals(true, e instanceof Debugger.InvalidTabsToIndentException);
						System.assertEquals(null, debug);
					}
				}
			}
		}

		// String toString()
		{
			final String toString = d.toString();

			System.assertEquals(d.getDebug(0), toString);

			// Integer hashCode()
			{
				System.assertEquals(toString.hashCode(), d.hashCode());
			}

			// Boolean equals(Object that)
			for(Object that : new Object[] {
				null, 
				new Debugger_TEST(), 
				d, 
				d.clone()
			}) {
				System.assertEquals(
					that instanceof Debugger && toString.equals(((Debugger) that).toString()), 
					d.equals(that)
				);
			}
		}

		// Debugger debug()
		{
			d.debug();
			System.assertEquals(true, true, 'Cannot test System.debug(...) was called');
		}
	}

	/*
	██████╗██████╗██████╗██████╗
	╚═██╔═╝██╔═══╝██╔═══╝╚═██╔═╝
	  ██║  ████╗  ██████╗  ██║  
	  ██║  ██╔═╝  ╚═══██║  ██║  
	  ██║  ██████╗██████║  ██║  
	  ╚═╝  ╚═════╝╚═════╝  ╚═╝  
	*/
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
	@IsTest
	public static void testAssertAndIsValidTabsToIndent() {
		// Data
		final Integer[] tabsToIndents = new Integer[] {
			null, 
			-1, 
			0, 
			1
		};
	
		// --------------------------------  Start Test  -------------------------------- 
		Test.startTest();
		
		// Debugger
		{
			// Boolean isTabsToIndentValid(Integer tabsToIndent)
			for(Integer tabsToIndent : tabsToIndents) {
				System.assertEquals(
					tabsToIndent != null && -1 < tabsToIndent, 
					Debugger.isTabsToIndentValid(tabsToIndent)
				);

				// void assertTabsToIndentIsValid(Integer tabsToIndent)
				{
					Exception e;

					try {
						Debugger.assertTabsToIndentIsValid(tabsToIndent);
					} catch(Exception whoops) {
						e = whoops;
					}

					if(Debugger.isTabsToIndentValid(tabsToIndent)) {
						System.assertEquals(null, e);
					}
					else {
						System.assertEquals(true, e instanceof Debugger.InvalidTabsToIndentException);
					}
				}
			}
		}
	
		Test.stopTest();
		// ----------------------------  Stop Test  ----------------------------
	}

	/*
	██████╗██████╗██████╗██████╗
	╚═██╔═╝██╔═══╝██╔═══╝╚═██╔═╝
	  ██║  ████╗  ██████╗  ██║  
	  ██║  ██╔═╝  ╚═══██║  ██║  
	  ██║  ██████╗██████║  ██║  
	  ╚═╝  ╚═════╝╚═════╝  ╚═╝  
	*/
	/*
	█████╗ ██████╗██████╗ ██╗  ██╗ █████╗ 
	██╔═██╗██╔═══╝██╔══██╗██║  ██║██╔═══╝ 
	██║ ██║████╗  ██████╔╝██║  ██║██║ ███╗
	██║ ██║██╔═╝  ██╔══██╗██║  ██║██║  ██║
	█████╔╝██████╗██████╔╝╚█████╔╝╚█████╔╝
	╚════╝ ╚═════╝╚═════╝  ╚════╝  ╚════╝ 
	*/
	/**
	 * @description Tests Debugger's debug(...)
	 */
	@IsTest
	public static void testDebug() {
		// Data
		final InterfaceSample sample = new InterfaceSample();
		System.assertEquals(true, (Object) sample instanceof Debuggable);

		final List<Map<String, Object>> maps = new List<Map<String, Object>> {
			null, 
			new Map<String, Object> {
				'null' => null, 
				'String' => 'test', 
				'Date' => Date.today(), 
				'Datetime' => Datetime.now(), 
				'Boolean' => true, 
				'InterfaceSample' => sample
			}
		};
		final Exception[] exceptions = new Exception[] {
			null, 
			new TestException()
		};
		final SObject[] records = new SObject[] {
			null, 
			new User(), 
			new User(
				FirstName = 'First Name', 
				Alias = 'Alias', 
				Username = 'test@example.com'
			)
		};
		final List<List<Object>> allObjects = new List<List<Object>> {
			null, 
			maps[1].values()
		};
		final List<Set<Id>> allIds = new List<Set<Id>> {
			null, 
			new Set<Id> {
				UserInfo.getUserId(), 
				UserInfo.getOrganizationId()
			}
		};
		final List<Set<String>> allStrings = new List<Set<String>> {
			null, 
			maps[1].keySet()
		};
		final Object[] values = new Object[] {
			null, 
			new Debugger_TEST(), 
			maps[1], 
			sample, 
			exceptions[1], 
			records[1], 
			allObjects[1], 
			allIds[1], 
			allStrings[1]
		};
	
		// --------------------------------  Start Test  -------------------------------- 
		Test.startTest();
	
		// Debugger
		{
			// Map<String, Object> debug(Exception e)
			for(Exception e : exceptions) {
				if(e == null) {
					System.assertEquals(null, Debugger.debug(e));
				}
				else {
					System.assertEquals(
						new Map<String, Object> {
							System.Label.Exception_Type_Name => e.getTypeName(), 
							System.Label.Exception_Message => e.getMessage(), 
							System.Label.Exception_Line_Number => e.getLineNumber(), 
							System.Label.Exception_Stack_Trace => String.isBlank(e.getStackTraceString()) ? null : e.getStackTraceString().split('\n'), 
							System.Label.Exception_Cause => e.getCause()
						}, 
						Debugger.debug(e)
					);
				}
			}

			// Map<String, Object> debug(SObject record)
			for(SObject record : records) {
				if(record == null) {
					System.assertEquals(null, Debugger.debug(record));
				}
				else {
					System.assertEquals(
						record.getPopulatedFieldsAsMap(), 
						Debugger.debug(record)
					);
				}
			}

			// Map<String, Object> debug(Object[] objects)
			for(Object[] objects : allObjects) {
				if(objects == null) {
					System.assertEquals(null, Debugger.debug(objects));
				}
				else {
					final Map<String, Object> expectedDebug = new Map<String, Object>();
					{
						Integer i = 0;
						for(Object obj : objects) {
							expectedDebug.put('#' + (i ++), obj);
						}
					}

					System.assertEquals(
						expectedDebug, 
						Debugger.debug(objects)
					);
				}
			}

			// Map<String, Object> debug(Set<Id> ids)
			for(Set<Id> ids : allIds) {
				if(ids == null) {
					System.assertEquals(null, Debugger.debug(ids));
				}
				else {
					System.assertEquals(
						Debugger.debug(new List<Id>(ids)), 
						Debugger.debug(ids)
					);
				}
			}

			// Map<String, Object> debug(Set<String> strings)
			for(Set<String> strings : allStrings) {
				if(strings == null) {
					System.assertEquals(null, Debugger.debug(strings));
				}
				else {
					System.assertEquals(
						Debugger.debug(new List<String>(strings)), 
						Debugger.debug(strings)
					);
				}
			}

			// Map<String, Object> debug(Object value)
			{
				Map<String, Boolean> testChecks = new Map<String, Boolean>();
				
				// Intitialize testChecks
				for(String label : new String[] {
					'null', 
					'Map<String, Object>', 
					'Debuggable', 
					'Exception', 
					'SObject', 
					'Object[]', 
					'Set<Id>', 
					'Set<String>', 
					'else'
				}) {
					testChecks.put(label, false);
				}
				
				// Test
				for(Object value : values) {
					if(value == null) {
						System.assertEquals(
							null, 
							Debugger.debug(value)
						);
						testChecks.put('null', true);
					}
					else if(value instanceof Map<String, Object>) {
						System.assertEquals(
							(Map<String, Object>) value, 
							Debugger.debug(value)
						);
						testChecks.put('Map<String, Object>', true);
					}
					else if(value instanceof Debuggable) {
						System.assertEquals(
							((Debuggable) value).debug(), 
							Debugger.debug(value)
							);
						testChecks.put('Debuggable', true);
					}
					else if(value instanceof Exception) {
						System.assertEquals(
							Debugger.debug((Exception) value), 
							Debugger.debug(value)
						);
						testChecks.put('Exception', true);
					}
					else if(!(value instanceof SObject[]) && value instanceof SObject) {
						System.assertEquals(
							Debugger.debug((SObject) value), 
							Debugger.debug(value)
						);
						testChecks.put('SObject', true);
					}
					else if(value instanceof Object[]) {
						System.assertEquals(
							Debugger.debug((Object[]) value), 
							Debugger.debug(value)
						);
						testChecks.put('Object[]', true);
					}
					else if(value instanceof Set<Id>) {
						System.assertEquals(
							Debugger.debug((Set<Id>) value), 
							Debugger.debug(value)
						);
						testChecks.put('Set<Id>', true);
					}
					else if(value instanceof Set<String>) {
						System.assertEquals(
							Debugger.debug((Set<String>) value), 
							Debugger.debug(value)
						);
						testChecks.put('Set<String>', true);
					}
					else {
						System.assertEquals(
							null, 
							Debugger.debug(value)
						);
						testChecks.put('else', true);
					}
				}

				// Assert every condition was tested
				for(String label : testChecks.keySet()) {
					System.assertEquals(true, testChecks.get(label), label);
				}
			}
		}
	
		Test.stopTest();
		// --------------------------------  Stop Test  ---------------------------------
	}

	/*
	██████╗██████╗██████╗██████╗
	╚═██╔═╝██╔═══╝██╔═══╝╚═██╔═╝
	  ██║  ████╗  ██████╗  ██║  
	  ██║  ██╔═╝  ╚═══██║  ██║  
	  ██║  ██████╗██████║  ██║  
	  ╚═╝  ╚═════╝╚═════╝  ╚═╝  
	*/
	/*
	██╗  ██╗ █████╗ ██╗    ██╗  ██╗██████╗
	██║  ██║██╔══██╗██║    ██║  ██║██╔═══╝
	██║  ██║███████║██║    ██║  ██║████╗  
	╚██╗██╔╝██╔══██║██║    ██║  ██║██╔═╝  
	 ╚███╔╝ ██║  ██║██████╗╚█████╔╝██████╗
	  ╚══╝  ╚═╝  ╚═╝╚═════╝ ╚════╝ ╚═════╝
	*/
	@IsTest
	public static void testValue() {
		// Data
		final InterfaceSample sample = new InterfaceSample();
		final String[] labels = new String[] {
			null, 
			'label'
		};
		final Object[] values = new Object[] {
			null,
			'value',
			123,
			Date.today(),
			Datetime.now(),
			sample
		};
		final Integer[] tabsToIndents = new Integer[] {
			null,
			-1,
			0,
			7
		};

		// ----------------------------------  Start Test  ----------------------------------
		Test.startTest();


		// Value(String label, Object value)
		for(String label : labels) {
			for(Object value : values) {
				final Debugger.Value v = new Debugger.Value(label, value);
				
				// Construction
				{
					System.assertEquals(label, v.l);
					System.assertEquals(value, v.v);	
				}

				// String getLabel()
				{
					System.assertEquals(v.l, v.getLabel());
				}
				// Object getValue()
				{
					System.assertEquals(v.v, v.getValue());
				}
				
				// String toString()
				{
					System.assertEquals(
						v.getLabel() + ': ' + v.getValue(), 
						v.toString()
					);
				}

				// Integer hashCode()
				{
					System.assertEquals(
						v.toString().hashCode(), 
						v.hashCode()
					);
				}

				// Boolean equals(Object that)
				for(Object that : new Object[] {
					null, 
					new Debugger_TEST(), 
					v, 
					v.clone()
				}) {
					System.assertEquals(
						that instanceof Debugger.Value && v.toString().equals(((Debugger.Value) that).toString()), 
						v.equals(that)
					);
				}

				// Debugger.Printable
				{
					// String getDebug(Integer tabsToIndent)
					for(Integer tabsToIndent : tabsToIndents) {
						Exception e;
						String debug;

						try {
							debug = v.getDebug(tabsToIndent);
						} catch(Exception whoops) {
							e = whoops;
						}

						if(Debugger.isTabsToIndentValid(tabsToIndent)) {
							System.assertEquals(null, e);
							System.assertEquals(
								'\t'.repeat(tabsToIndent) + v.toString(), 
								debug
							);
						}
						else {
							System.assertEquals(true, e instanceof Debugger.InvalidTabsToIndentException);
							System.assertEquals(null, debug);
						}
					}

					// String getHtmlDebug()
					{
						System.assertEquals(v.toString(), v.getHtmlDebug());
					}
				}
			}
		}
		
		Test.stopTest();
		// ----------------------------------  Stop Test  ----------------------------------
	}

	/*
	██████╗██████╗██████╗██████╗
	╚═██╔═╝██╔═══╝██╔═══╝╚═██╔═╝
	  ██║  ████╗  ██████╗  ██║  
	  ██║  ██╔═╝  ╚═══██║  ██║  
	  ██║  ██████╗██████║  ██║  
	  ╚═╝  ╚═════╝╚═════╝  ╚═╝  
	*/
	/*
	█████╗ ██████╗██████╗ ██╗  ██╗ █████╗  █████╗ ██████╗█████╗ 
	██╔═██╗██╔═══╝██╔══██╗██║  ██║██╔═══╝ ██╔═══╝ ██╔═══╝██╔═██╗
	██║ ██║████╗  ██████╔╝██║  ██║██║ ███╗██║ ███╗████╗  █████╔╝
	██║ ██║██╔═╝  ██╔══██╗██║  ██║██║  ██║██║  ██║██╔═╝  ██╔═██╗
	█████╔╝██████╗██████╔╝╚█████╔╝╚█████╔╝╚█████╔╝██████╗██║ ██║
	╚════╝ ╚═════╝╚═════╝  ╚════╝  ╚════╝  ╚════╝ ╚═════╝╚═╝ ╚═╝
	*/


	/**
	 * @description 
	 */
	@IsTest
	public static void testDebugger() {
		// Data
		final InterfaceSample sample = new InterfaceSample();
		System.assertEquals(true, (Object) sample instanceof Debuggable);

		final String[] titles = new String[] {
			null, 
			'Title describing what I\'m debugging'
		};
		final Map<String, Object> values = new Map<String, Object> {
			null => null, 
			'Boolean' => true, 
			'User' => new User(
				FirstName = 'First Name', 
				Username = 'test@example.com', 
				Id = UserInfo.getUserId(), 
				Alias = 'alias'
			), 
			'sample' => sample
		};
		final Exception[] exceptions = new Exception[] {
			null, 
			new TestException('This is a test')
		};
		final Type[] exceptionTypes = new Type[] {
			null, 
			Debugger_TEST.class, 
			TestException.class
		};

		// --------------------------------  Start Test  -------------------------------- 
		Test.startTest();
	
		// Debugger
		for(String title : titles) {
			final Debugger d = new Debugger(title);
			System.assertEquals(true, (Object) d instanceof Debugger.Printable);

			// Construction
			{
				System.assertEquals(title, d.t);
				System.assertNotEquals(null, d.p);
				System.assertEquals(true, d.p.isEmpty());

				assertIsValid(d);
			}

			// Virtual
			{
				// String getBorderCharacter()
				{
					System.assertEquals('=', d.getBorderCharacter());
				}
				// Integer getBorderPadding()
				{
					System.assertEquals(3, d.getBorderPadding());
				}
				// String getHtmlHeader()
				{
					System.assertEquals('h2', d.getHtmlHeader());
				}
			}

			// Debugger add(...)
			{
				d.clear();
				Integer size = d.size();

				// Debugger add(String label, Object value)
				{
					// values
					for(String label : values.keySet()) {
						final Object value = values.get(label);

						final Debugger.Printable expectedPrintable = Debugger.getPrintable(
							label, 
							value
						);
						
						d.add(label, value);

						assertIsValid(d);

						if(expectedPrintable == null) {
							System.assertEquals(size, d.size());
						}
						else {
							System.assertEquals(++ size, d.size());
							System.assertEquals(
								expectedPrintable, 
								d.getPrintables()[size - 1]
							);
						}
					}
				}

				// Debugger add(Exception e)
				for(Exception e : exceptions) {
					final String label = e == null ? 'Exception' : e.getTypeName();
					final Object value = e;

					final Debugger.Printable expectedPrintable = Debugger.getPrintable(
						label, 
						value
					);
					
					d.add(e);

					assertIsValid(d);

					if(expectedPrintable == null) {
						System.assertEquals(size, d.size());
					}
					else {
						System.assertEquals(++ size, d.size());
						System.assertEquals(
							expectedPrintable, 
							d.getPrintables()[size - 1]
						);
					}
				}
			
				// Debugger add(Printable printable)
				{
					d.add(sample);

					assertIsValid(d);

					// sample != null
					{
						System.assertEquals(++ size, d.size());
						System.assertEquals(
							true, 
							sample === d.getPrintables()[size - 1]
						);
					}
				}
			}
		}

		// Test Util
		{
			// Throw Exception
			{
				// void throwException(Exception e)
				for(Exception ex : exceptions) {
					final Debugger d = new Debugger('Title')
						.add('Boolean', true)
						.add('sample', sample)
						.add(new TestException('This is a test'));
					Exception e;

					try {
						d.throwException(ex);
					} catch(Exception whoops) {
						e = whoops;
					}

					if(ex == null) {
						System.assertEquals(true, e instanceof Debugger.UnknownException);
					}
					else {
						System.assertEquals(true, e === ex);
					}
					System.assertEquals(d.toString(), e.getMessage());
				}

				// void throwException(Type exceptionType)
				for(Type exceptionType : exceptionTypes) {
					final Debugger d = new Debugger('Title')
						.add('Boolean', true)
						.add('sample', sample)
						.add(new TestException('This is a test'));
					Exception e;

					try {
						d.throwException(exceptionType);
					} catch(Exception whoops) {
						e = whoops;
					}

					if(exceptionType == null || !(exceptionType.newInstance() instanceof Exception)) {
						System.assertEquals(true, e instanceof Debugger.UnknownException);
					}
					else if(exceptionType == TestException.class) {
						System.assertEquals(true, e instanceof TestException);
					}
					System.assertEquals(d.toString(), e.getMessage());
				}

				// void throwException()
				{
					final Debugger d = new Debugger('Title')
						.add('Boolean', true)
						.add('sample', sample)
						.add(new TestException('This is a test'));
					Exception e;

					try {
						d.throwException();
					} catch(Exception whoops) {
						e = whoops;
					}

					System.assertEquals(true, e instanceof Debugger.UnknownException);
					System.assertEquals(d.toString(), e.getMessage());
				}
			}

			// Assert Equals
			{
				// Debugger assertEquals(Object expected, Object actual, String title)
				for(String title : titles) {
					final Debugger d = new Debugger('Title');
					final Debugger.Tab expectedTab = new Debugger.Tab(
						title == null ? 'Assert Equals' : title
					);
					
					final Object expected = sample;
					expectedTab
						.add('expected', expected)
						.add('actual', expected);

					d.assertEquals(
						expected, 
						expected, 
						title
					);

					System.assertEquals(1, d.size());
					System.assertEquals(
						expectedTab, 
						d.getPrintables()[0]
					);
				}

				// Debugger assertEquals(Object expected, Object actual)
				{
					final Debugger expectedDebugger = new Debugger('Title');
					final Debugger actualDebugger = new Debugger('Title');

					final Object expected = sample;
					expectedDebugger.assertEquals(
						expected, 
						expected, 
						(String) null
					);

					actualDebugger.assertEquals(
						expected, 
						expected
					);

					System.assertEquals(1, actualDebugger.size());
					System.assertEquals(
						expectedDebugger.getPrintables()[0], 
						actualDebugger.getPrintables()[0]
					);
				}

				// Debugger assertNotEquals(Object expected, Object actual, String title)
				for(String title : titles) {
					final Debugger d = new Debugger('Title');
					final Debugger.Tab expectedTab = new Debugger.Tab(
						title == null ? 'Assert Not Equals' : title
					);
					
					final Object expected = sample;
					final Object actual = null;
					expectedTab
						.add('expected', expected)
						.add('actual', actual);

					d.assertNotEquals(
						expected, 
						actual, 
						title
					);

					System.assertEquals(1, d.size());
					System.assertEquals(
						expectedTab, 
						d.getPrintables()[0]
					);
				}

				// Debugger assertNotEquals(Object expected, Object actual)
				{
					final Debugger expectedDebugger = new Debugger('Title');
					final Debugger actualDebugger = new Debugger('Title');

					final Object expected = sample;
					final Object actual = null;
					expectedDebugger.assertNotEquals(
						expected, 
						actual, 
						(String) null
					);

					actualDebugger.assertNotEquals(
						expected, 
						actual
					);

					System.assertEquals(1, actualDebugger.size());
					System.assertEquals(
						expectedDebugger.getPrintables()[0], 
						actualDebugger.getPrintables()[0]
					);
				}
			}
		}
	
		Test.stopTest();
		// --------------------------------  Stop Test  ---------------------------------
	}

	/*
	██████╗██████╗██████╗██████╗
	╚═██╔═╝██╔═══╝██╔═══╝╚═██╔═╝
	  ██║  ████╗  ██████╗  ██║  
	  ██║  ██╔═╝  ╚═══██║  ██║  
	  ██║  ██████╗██████║  ██║  
	  ╚═╝  ╚═════╝╚═════╝  ╚═╝  
	*/
	/*
	██████╗ █████╗ ██████╗ 
	╚═██╔═╝██╔══██╗██╔══██╗
	  ██║  ███████║██████╔╝
	  ██║  ██╔══██║██╔══██╗
	  ██║  ██║  ██║██████╔╝
	  ╚═╝  ╚═╝  ╚═╝╚═════╝ 
	*/
	/**
	 * @description 
	 */
	@IsTest
	public static void testTab() {
		// Data
		final String[] titles = new String[] {
			null, 
			'Title'
		};
	
		// --------------------------------  Start Test  -------------------------------- 
		Test.startTest();
		
		// Debugger.Tab
		for(String title : titles) {
			final Debugger d = new Debugger(title);
			final Debugger.Tab tab = new Debugger.Tab(title);
			System.assertEquals(true, (Object) tab instanceof Debugger);
			System.assertEquals(true, (Object) tab instanceof Debugger.Printable);

			// Super
			{
				System.assertEquals(
					d.getTitle(), 
					tab.getTitle()
				);
			}

			// String getBorderCharacter()
			{
				System.assertEquals('-', tab.getBorderCharacter());
			}

			// String getHtmlHeader()
			{
				System.assertEquals('h3', tab.getHtmlHeader());
			}

			// Boolean equals(Object that)
			for(Object that : new Object[] {
				null, 
				new Debugger_TEST(), 
				d, 
				tab, 
				tab.clone()
			}) {
				System.assertEquals(
					that instanceof Debugger.Tab && tab.toString().equals(((Debugger.Tab) that).toString()), 
					tab.equals(that)
				);
			}
		}

		Test.stopTest();
		// --------------------------------  Stop Test  ---------------------------------
	}

	/*
	██████╗██████╗██████╗██████╗
	╚═██╔═╝██╔═══╝██╔═══╝╚═██╔═╝
	  ██║  ████╗  ██████╗  ██║  
	  ██║  ██╔═╝  ╚═══██║  ██║  
	  ██║  ██████╗██████║  ██║  
	  ╚═╝  ╚═════╝╚═════╝  ╚═╝  
	*/
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
	/**
	 * @description 
	 */
	@IsTest
	public static void testGetPrintable() {
		// Data
		final InterfaceSample sample = new InterfaceSample();
		System.assertEquals(true, (Object) sample instanceof Debuggable);

		final List<Map<String, Object>> maps = new List<Map<String, Object>> {
			null, 
			new Map<String, Object> {
				'null' => null, 
				'String' => 'String', 
				'Date' => Date.today(), 
				'Datetime' => Datetime.now(), 
				'Boolean' => true
			}
		};
		final Exception[] exceptions = new Exception[] {
			null, 
			new TestException()
		};
		final SObject[] records = new SObject[] {
			null, 
			new User(), 
			new User(
				FirstName = 'First Name', 
				Alias = 'Alias', 
				Username = 'test@example.com'
			)
		};
		final List<List<Object>> allObjects = new List<List<Object>> {
			null, 
			maps[1].values()
		};
		final List<Set<Id>> allIds = new List<Set<Id>> {
			null, 
			new Set<Id> {
				UserInfo.getUserId(), 
				UserInfo.getOrganizationId()
			}
		};
		final List<Set<String>> allStrings = new List<Set<String>> {
			null, 
			maps[1].keySet()
		};

		final Map<String, Object> simpleValuesByLabel = new Map<String, Object> {
			'null' => null, 
			'Map<String, Object>' => maps[1], 
			'Debuggable' => sample, 
			'Exception' => exceptions[1], 
			'SObject' => records[1], 
			'Object[]' => allObjects[1], 
			'Set<Id>' => allIds[1], 
			'Set<String>' => allStrings[1], 
			'String' => 'String', 
			'Date' => Date.today(), 
			'Datetime' => Datetime.now(), 
			'Integer' => Crypto.getRandomInteger(), 
			'Boolean' => true, 
			'Not Debuggable' => new Debugger_TEST()
		};
	
		// --------------------------------  Start Test  -------------------------------- 
		Test.startTest();
		
		// Debugger
		{
			// Printable getPrintable(String label, Object value)
			for(String label : simpleValuesByLabel.keySet()) {
				final Object value = simpleValuesByLabel.get(label);
				
				// Set expected
				Debugger.Printable expected;
				{
					Map<String, Object> debug = Debugger.debug(value);
					if(debug == null) {
						expected = new Debugger.Value(label, value);
					}
					else {
						expected = Debugger.getTab(label, debug);
					}
				}

				System.assertEquals(
					expected, 
					Debugger.getPrintable(label, value)
				);
			}
		}
	
		Test.stopTest();
		// --------------------------------  Stop Test  ---------------------------------
	}

	/*
	██████╗██████╗██████╗██████╗
	╚═██╔═╝██╔═══╝██╔═══╝╚═██╔═╝
	  ██║  ████╗  ██████╗  ██║  
	  ██║  ██╔═╝  ╚═══██║  ██║  
	  ██║  ██████╗██████║  ██║  
	  ╚═╝  ╚═════╝╚═════╝  ╚═╝  
	*/
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
	/**
	 * @description 
	 */
	@IsTest
	public static void testGetTab() {
		// Data
		final InterfaceSample sample = new InterfaceSample();
		System.assertEquals(true, (Object) sample instanceof Debuggable);

		final List<Map<String, Object>> maps = new List<Map<String, Object>> {
			null, 
			new Map<String, Object> {
				'null' => null, 
				'String' => 'String', 
				'Date' => Date.today(), 
				'Datetime' => Datetime.now(), 
				'Boolean' => true
			}
		};
		final Exception[] exceptions = new Exception[] {
			null, 
			new TestException()
		};
		final SObject[] records = new SObject[] {
			null, 
			new User(), 
			new User(
				FirstName = 'First Name', 
				Alias = 'Alias', 
				Username = 'test@example.com'
			)
		};
		final List<List<Object>> allObjects = new List<List<Object>> {
			null, 
			maps[1].values()
		};
		final List<Set<Id>> allIds = new List<Set<Id>> {
			null, 
			new Set<Id> {
				UserInfo.getUserId(), 
				UserInfo.getOrganizationId()
			}
		};
		final List<Set<String>> allStrings = new List<Set<String>> {
			null, 
			maps[1].keySet()
		};

		final Map<String, Map<String, Object>> debugsByTitle = new Map<String, Map<String, Object>> {
			'null' => null, 
			'empty' => new Map<String, Object>(), 
			'simple' => new Map<String, Object> {
				'null' => null, 
				'Map<String, Object>' => maps[1], 
				'Debuggable' => sample, 
				'Exception' => exceptions[1], 
				'SObject' => records[1], 
				'Object[]' => allObjects[1], 
				'Set<Id>' => allIds[1], 
				'Set<String>' => allStrings[1], 
				'String' => 'String', 
				'Date' => Date.today(), 
				'Datetime' => Datetime.now(), 
				'Integer' => Crypto.getRandomInteger(), 
				'Boolean' => true, 
				'Not Debuggable' => new Debugger_TEST()
			}, 
			'composite' => new Map<String, Object> {
				'null' => null, 
				'Map<String, Object>' => maps[1], 
				'Debuggable' => sample, 
				'Exception' => exceptions[1], 
				'SObject' => records[1], 
				'Object[]' => allObjects[1], 
				'Set<Id>' => allIds[1], 
				'Set<String>' => allStrings[1], 
				'String' => 'String', 
				'Date' => Date.today(), 
				'Datetime' => Datetime.now(), 
				'Integer' => Crypto.getRandomInteger(), 
				'Boolean' => true, 
				'Not Debuggable' => new Debugger_TEST(), 
				'Composite Debug' => new Map<String, Object> {
					'null' => null, 
					'String' => 'String', 
					'Date' => Date.today(), 
					'Datetime' => Datetime.now(), 
					'Boolean' => true, 
					'SObject[]' => new SObject[] {
						records[1], 
						records[2]
					}, 
					'Debuggable' => sample
				}
			}
		};
	
		// --------------------------------  Start Test  -------------------------------- 
		Test.startTest();
		
		// Debugger
		{
			// Tab getTab(String title, Map<String, Object> debug)
			for(String title : debugsByTitle.keySet()) {
				final Map<String, Object> debug = debugsByTitle.get(title);

				final Debugger.Tab expected = new Debugger.Tab(title);
				// Set expected
				{
					if(debug != null) {
						for(String label : debug.keySet()) {
							expected.add(Debugger.getPrintable(label, debug.get(label)));
						}
					}
				}

				System.assertEquals(
					expected, 
					Debugger.getTab(title, debug)
				);
			}
		}

		Test.stopTest();
		// --------------------------------  Stop Test  ---------------------------------
	}
}

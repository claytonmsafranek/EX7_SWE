
public aspect traceAspectSafranek {
	
	pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
	
	//trace method
	pointcut methodToTrace(): classToTrace() && execution(String getName());
	
	//trace before execution
	before(): methodToTrace() {
		String info = thisJoinPointStaticPart.getSignature() + ", "
				+ thisJoinPointStaticPart.getSourceLocation().getLine();
		//print out results
		System.out.println("[BGN] " + info);
	}
	
	//trace after execution
	after(): methodToTrace() {
		String info = thisJoinPointStaticPart.getSourceLocation().getFileName();
		//print out results
		System.out.println("[END] " + info);
	}
}

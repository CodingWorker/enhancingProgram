@RequestMapping("/index")
@ResponseBody
public String index(@RequestParam(name = "incr",required = false,defaultValue = "0") int incr){
	SingletonDemo singletonDemo=SingletonDemo.getInstance();
	singletonDemo.incrCount(incr);
	return singletonDemo.getCount()+"";
}
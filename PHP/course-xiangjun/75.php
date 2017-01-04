<?php 
/*文件内容分页操作类
ceil($value)返回不小于$value的最小整数
__construct()前边是两个_
parce_url()可以将页面的url截取为数组，分为路径和传参

||====================||
||      没做完        ||
||                    ||
||====================||



*/
class strPage{
	private $file;//文件内容
	private $current;//当前页
	private $totalpage;//总的页数
	private $url;
	private $pagelen;//每一页显示的字符长度
	function __construct($file,$len=1500){
		$this->file=file_get_contents($file);
		$this->current=isset($_GET['page'])?$_GET['page']:1;
		$this->pagelen=
		$len;
		$this->totalpage=$this->getTotalPage();
		$this->url=$this->getUrl();
		echo $this->url;
	}
	private function getTotalPage(){
		return ceil(strlen($this->file)/$this->pagelen);//取得不小于value的最小整数

	}
	private function getUrl(){
//		echo $_SERVER['QUERY_STRING'];
		$url=parse_url($_SERVER['REQUEST_URI']);//解析出页面路径
		//print_r($url);
		parse_str($url['query'],$queryArr);
		//print_r($queryArr);
		unset($queryArr['page']);
		$querystr=http_build_query($queryArr);
		return $url['path'].'?'.$querystr."&page=";
	}
	private function first(){
		if ($this->current>1) {
			return "<a href='".$this->url."1'>首页</a>";
		}else{
			return '首页';
		}
	}
	private function next(){
		if ($this->current<$this->totalpage){
			return "<a href='".$this->url.($this->current+1)."'>下一页</a>";
		}else{
			return '下一页';
		}
	}
	private function pre (){
		if($this->current>1) {
			return "<a href='".$this->url.($this->current-1)."'>上一页</a>";
		}else{
			return '上一页';
		}
	}
	private function end(){
		if($this->current<=$this->totalpage){
			return "<a href='".$this->url.$this->totalpage."'>末页</a>";
		}else{
			return '末页';
		}
	}
	private function pageList(){
		$pageliststr='';
		for($i=1;$i<=$this->totalpage;$i++){
			if ($i==$this->current) {//当前页时仅输出，不做链接
				$pageliststr.=$i;
			}else{//不是当前页时做链接
				$pageliststr.="<a href='".$this->url.$i."'>{$i}</a>";
			}
		}
		return $pageliststr;
	}
	public function pageStyle($style=1){
		switch ($style) {
			case '1':
				return "共有".$this->totalpage."页".$this->first().$this->pre().$this->pageList().$this->next().$this->end();
				break;
			case '2':
				return $this->pageLise();
				break;
			default:
				# code...
				break;
		}
	}
}
$page=new strPage('a.txt',2000);
//echo ceil(5.5);//输出不小于5.5的最小整数
echo "<br/>";
echo $page->pageStyle(1);

















 ?>
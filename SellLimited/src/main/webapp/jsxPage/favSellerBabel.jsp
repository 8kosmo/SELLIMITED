<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String s="codecobaine";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>json 파일 읽어서 화면 출력하기{jsonDeptListBabel.jsp}</title>
<script src="https://unpkg.com/react@16.10.2/umd/react.production.min.js"></script>
<script src="https://unpkg.com/react-dom@16.10.2/umd/react-dom.production.min.js"></script>
<script src="https://unpkg.com/babel-standalone@6.15.0/babel.min.js"></script>
<link rel="stylesheet" href="/css/favSeller.css">

</head>
<body>
<!-- 라이프 사이클 분류
	1.마운트 이벤트
		:React Element를 DOM 노드에 추가할 때 발생
		발생 횟수 => 한 번
	2.갱신 이벤트
		:속성이나 상태가 변경되어 React 앨리먼트를 갱신할 때 발생
		발생 횟수=> 여러 번 
	3.언마운트 이벤트
		:DOM이 제거될 떄 발생
		발생 횟수 => 한 번
 -->
<div id="d_favSeller"></div>
<script type="text/babel">
class FavList extends React.Component{
	constructor(props){
		super(props)
		this.state={favSellers: [] //josn포맷 내용이 들어갈 부분 현재는 빈상태
		}
	}
	//라이프사이클 콜백함수임. - 자동호출이 된다.
	//그럼 언제 자동호출 되는 걸까? DOM이 삽입 되고 렌더링이 완료된 후에
	componentDidMount(){
		fetch('/rest/favSellerList.sf?mem_id=codecobaine')
		.then(response => response.json())
		.then(favSellers => this.setState({favSellers:favSellers}))
	}

	render(){
		//return "테스트"
		return React.createElement(
			'div',null,React.createElement
				("table",{className: "mypage_table_head"},React.createElement
					("tbody",null,this.state.favSellers.map
						(favSeller => React.createElement("tr",null
									  	,React.createElement("td",null,favSeller.FAV_SELLERID)
									  	,React.createElement("td",null,favSeller.MEM_JDATE)
										,React.createElement("td",null,favSeller.CNTBID)
										,React.createElement("td",null,favSeller.MIN_DATE)

										)
						)
				     )//tbody
				)//table
		)//return
	}//render
}//end of favList
//render 함수 호출하기
ReactDOM.render(<FavList/>,document.getElementById('d_favSeller'));
</script>
</body>
</html>
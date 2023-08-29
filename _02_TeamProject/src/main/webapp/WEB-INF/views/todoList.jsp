<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.entity.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>To Do List</title>


<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">

<style>

hr {
	width: 445px;
}

.main {
	margin-top: 60px;
}

.todo {
	font-family: 'Gwangyang Touching';
	coler: #7c653f;
	font-size: 20px;
	width: 200px;
	background-color: #e3eeff;
	border-radius: 10px;
	margin-left: 5px;
	padding-top: 5px;
	border-radius: 10px;
	font-size: 20px;
}

.form-control {
	width: 350px !important;
}

.main-top {
	background-color: white;
	padding: 10px;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
}

.task {
	margin-top: 5px;
	padding-bottom: 15px;
}

.task-done {
	background-color: #3f4756;
	border-radius: 10px;
}

#task-board {
	width: 465px;
	font-family: 'Gwangyang Touching';
	height: 450px;
	overflow-y: auto;
	padding: 10px;
}

#task-board::-webkit-scrollbar {
	width: 10px;
}

#task-board::-webkit-scrollbar-thumb {
	height: 30%;
	background: #217af4;
	border-radius: 10px;
}

#task-board::-webkit-scrollbar-track {
	background: rgba(33, 122, 244, .1);
}

.title {
	position: relative;
	text-align: center;
}

#nick {
	font-size: 35px;
	color: #613f0e;
	height: 50px;
}

#nick {
	font-family: 'Gwangyang Touching';
	position: relative;
	text-align: center;
}

.input-area {
	font-family: 'Gwangyang Touching';
}

#modal.modal-overlay {
	width: 465px;
	height: 150px;
	left: 0;
	right: 0;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(50px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-window {
	display: flex;
	justify-content: space-evenly;
	align-items: baseline;
	position: absolute;
	padding: 15px;
	background: rgba(195, 228, 255, 0.7);
	box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(50px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#text-close {
	position: absolute;
	right: 7px;
	top: 0px;
	font-size: small;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: rgb(36, 22, 22);
}
</style>

</head>

<body>
	<%
	Member user = (Member) session.getAttribute("user");
	String email = (String) session.getAttribute("email");
	String nickname = (String) session.getAttribute("nickname");
	%>
	<!-- 모두를 감싸주는 div -->
	<div class="main-top" style="width: 465px; margin: 10px;">
		<!-- 타이틀 ~ 입력태그까지 감싸는 div 시작-->
		<div class="main">
			<div class="title">
				<%
				if (user != null) {
				%>
				<h1 id="nick">
					<%=user.getMb_nick()%>님의 To-do List
				</h1>
				<%
				} else if (nickname != null) {
				%>
				<h1 id="nick">
					<%=nickname%>님의 To-do List
				</h1>
				<%
				} ;
				%>
			</div>
			<br>
			<div class="input-area">
				<div class="row g-2">
					<div class="col-auto">
						<input type="text" class="form-control" id="task-input"
							autofocus="autofocus" placeholder="To Do List 를 입력해주세요~">
					</div>
					<div class="col-auto">
						<button type="submit" class="btn btn-outline-warning mb-3"
							id="add-button">추가</button>
					</div>
					<%-- 응원글 출력 구역 시작
					<div id="task-cheer"></div>
						응원글 출력 구역 끝 --%>
					<div id="modal" class="modal-overlay" title="닫기">
						<div class="modal-window col-auto">
							<input type="text" class="form-control" id="task-modify"
								autofocus="autofocus" placeholder="수정 내용을 입력해주세요~">
							<button type="submit" class="btn btn-outline-warning mb-3"
								id="modify-button">수정</button>
							<div id="text-close" title="닫기">x</div>
						</div>
					</div>
				</div>
			</div>
			<hr>
		</div>
		<!-- 타이틀 ~ 입력태그까지 감싸는 div 끝-->


		<!-- 할일 전체를 감싸는 구역 시작-->
		<div id="task-board">

			<!-- 할일1 시작
            <div class="row g-3 task">
                <div class="col todo">
                    <span class="todo">요리하기</span>
                </div>
                <div class="col-auto">
                    <button class="btn btn-outline-success">완료</button>
                    <button class="btn btn-outline-danger">삭제</button>
                </div>
            </div>
            할일1 끝-->

			<!-- 할일2 시작
            <div class="row g-3 task task-done">
                <div class="col todo">
                    <span class="todo">청소하기</span>
                </div>
                <div class="col-auto">
                    <button class="btn btn-outline-success">완료</button>
                    <button class="btn btn-outline-danger">삭제</button>
                </div>
            </div>
           할일2 끝 -->
		</div>
		<!-- 할일 전체를 감싸는 구역 끝-->
	</div>
	<!-- 모두를  감싸는 구역 끝-->

	<script src="https://code.jquery.com/jquery-3.7.0.js"
		integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
		crossorigin="anonymous"></script>


	<script>
                    // 1. 유저가 할일을 입력한다
                    // 2. 버튼을 누르면 할 일이 추가 된다
                    // 3. 추가된 목록을 다시 웹 페이지에 보여준다
                    // 4. '완료'버튼을 누르면 할일에 배경색이 들어간다(task-done 클래스의 스타일)
                    //  완료인지 미완료인지 구분 필요
                    // -> 할 일을 저장할 때 상태값을 저장해야 한다
                    // 4.1 할 일 저장(미완료) -> 완료 클릭 (완료) -> 또 클릭 (미완료)
                    //          -> 객체 형태로 저장
                    // 4-2 (만약) 할 일 상태가 완료(true) -> 배경색
                    // 4-2 (만약) 할 일 상태가 미완료(false) -> 배경색
                    // 5. 삭제 버튼을 누르면 해당 할 일이 삭제

                    // 사용자가 input창에 적는 할일
                    let taskInput = document.getElementById("task-input");
                    // 유저가 입력할 할일을 순차적으로 저장하는 배열
                    let taskList = [];
                    function todoSearch() {
                        $.ajax({
                            url: "todoSearch.do",
                            dataType: 'json',
                            success: function (res) {
                                console.log("todoSearch complete!");
                                console.log(res);
                                taskList = res;
                                console.log(taskList.length);
                                render();
                            },
                            error: function (e) {
                                console.log('todoSearch faild!');
                            }
                        });
                    };
                    todoSearch();
                    // 할 일 추가 버튼
                    let addButton = document.getElementById("add-button");
                    // 할일 전체를 담는 큰 div 생성
                    let taskBoard = document.getElementById("task-board");

                    // 내가 누른 완료버튼에 해당하는 할일 덩어리의 완료여부를 바꿔주는 함수
                    const toggleCheck = function (i) {
                        console.log('내가 선택한 할일', i);

                        // 배열의 형태로 저장된 할 일을 만드는 함수 생성
                        if (taskList[i].todo_status) {
                            taskList[i].todo_status = false;
                        } else {
                            taskList[i].todo_status = true;
                        };

                        // 변동사항이 생겼으면 최신배열 재출력
                        render();
                    };

                    // 내가 누른 삭제버튼에 해당하는 할일을 지워주는 함수
                    //  const deleteTask = function (i) {
                    //    taskList.splice(i, 1);

                    //      render();
                    //    }

                    // 배열 형태로 저장된 할 일을 웹페이지에 출력하는 함수
                    const render = function () {
                        let resultHTML = '';
                        for (let i = 0; i < taskList.length; i++) {
                            //완료 여부에 따른 할일 출력 isComplete == true : class "task task-done"
                            //완료 여부에 따른 할일 출력 isComplete == false : class "task"
                            if (taskList[i].todo_content != "") {
                                if (taskList[i].todo_status == "true") {
                                    resultHTML += `
            <div class="row g-3 task task-done">
                <div class="col todo">
                    <span class="todo">${taskList[i].todo_content}</span>
                </div>
                <div class="col-auto">
                    <button class="btn btn-outline-success" onclick="todoDone('${taskList[i].todo_seq}','${taskList[i].todo_status}')">완료</button>
                    <button class="btn btn-outline-success" onclick="todoRandom('${taskList[i].todo_seq}')">랜덤</button>
                    <button class="btn btn-outline-success" onclick = "todoUp('${taskList[i].todo_seq}','${i}')" title="위로">▲</button><br>
                    <button class="btn btn-outline-danger" onclick = "todoDelete('${taskList[i].todo_seq}')">삭제</button>
                    <button class="btn btn-outline-danger" onclick = "todoModifyOpen('${taskList[i].todo_seq}')">수정</button>
                    <button class="btn btn-outline-danger" onclick = "todoDown('${taskList[i].todo_seq}','${i}')" title="아래로">▼</button>
                </div>
            </div>
            `;
                                } else {
                                    resultHTML += `
            <div class="row g-3 task">
                <div class="col todo">
                    <span class="todo">${taskList[i].todo_content}</span>
                </div>
                <div class="col-auto">
                    <button class="btn btn-outline-success" onclick="todoDone('${taskList[i].todo_seq}','${taskList[i].todo_status}')">완료</button>
                    <button class="btn btn-outline-success" onclick="todoRandom('${taskList[i].todo_seq}')">랜덤</button>
                    <button class="btn btn-outline-success" onclick = "todoUp('${taskList[i].todo_seq}','${i}')" title="위로">▲</button><br>
                    <button class="btn btn-outline-danger" onclick = "todoDelete('${taskList[i].todo_seq}')">삭제</button>
                    <button class="btn btn-outline-danger" onclick = "todoModifyOpen('${taskList[i].todo_seq}')">수정</button>
                    <button class="btn btn-outline-danger" onclick = "todoDown('${taskList[i].todo_seq}','${i}')" title="아래로">▼</button>
                </div>
            </div>
            `;
                                };
                            };
                        };
                        taskBoard.innerHTML = resultHTML;
                    };

                    // 쓰기
                    function todoWrite() {
                        let taskInput = $("#task-input").val();
                                console.log(taskInput);
                        $.ajax({
                            url: "todoWrite.do",
                            type: "post",
                            data: {
                                "taskInput": taskInput
                            },
                            success: function (res) {
                                console.log("todoWrite complete!");
                                todoSearch();
                                getCheering();
                            },
                            error: function (e) {
                                console.log('todoWrite faild!');
                            }
                        });
                    };

                    // 삭제
                    function todoDelete(todo_seq) {
                        $.ajax({
                            url: "todoDelete.do",
                            type: "post",
                            data: {
                                "todo_seq": todo_seq
                            },
                            success: function (res) {
                                console.log("todoDelete complete!");
                                todoSearch();
                            },
                            error: function (e) {
                                console.log('todoDelete faild!');
                            }
                        });
                    };

                    // 완료
                    function todoDone(todo_seq, todo_status) {
                        if (todo_status === "false") {
                            $.ajax({
                                url: "todoDone.do",
                                type: "post",
                                data: {
                                    "todo_seq": todo_seq
                                },
                                success: function (res) {
                                    console.log("todoDone complete!");
                                    todoSearch();
                                    getCheering();
                                },
                                error: function (e) {
                                    console.log('todoDone faild!');
                                }
                            });
                        } else {
                            $.ajax({
                                url: "todoDoneCencel.do",
                                type: "post",
                                data: {
                                    "todo_seq": todo_seq
                                },
                                success: function (res) {
                                    console.log("todoDoneCencel complete!");
                                    todoSearch();
                                    getCheering();
                                },
                                error: function (e) {
                                    console.log('todoDoneCencel faild!');
                                }
                            });
                        };
                    };

                    // 업
                    function todoUp(todo_seq, i) {
                        console.log(todo_seq, i);
                        $.ajax({
                            url: "todoSearch.do",
                            dataType: 'json',
                            success: function (res) {
                                console.log("todoUp complete!");
                                taskList = res;
                                let todo_seq_1;
                                i = parseInt(i);
                                if (i - 1 >= 0) {
                                    console.log(taskList[i].todo_seq, taskList[i - 1].todo_seq);
                                    todoUpstairs(taskList[i].todo_seq, taskList[i - 1].todo_seq);
                                } else {
                                    alert("최상위 입니다~");
                                };
                            },
                            error: function (e) {
                                console.log('todoUp faild!');
                            }
                        });
                    };

                    // 업 완료 
                    function todoUpstairs(todo_seq, todo_seq_1) {
                        console.log(todo_seq, todo_seq_1);
                        $.ajax({
                            url: "todoChange.do",
                            type: "post",
                            data: {
                                "todo_seq": todo_seq,
                                "todo_seq_1": todo_seq_1,
                            },
                            success: function (res) {
                                console.log("todoUpstairs complete!");
                                todoSearch();
                            },
                            error: function (e) {
                                console.log('todoUpstairs faild!');
                            }
                        });
                    };

                    // 다운
                    function todoDown(todo_seq, i) {
                        console.log(todo_seq, i);
                        $.ajax({
                            url: "todoSearch.do",
                            dataType: 'json',
                            success: function (res) {
                                console.log("todoDown complete!");
                                taskList = res;
                                i = parseInt(i);
                                if (i + 1 < taskList.length) {
                                    console.log(taskList[i].todo_seq, taskList[i + 1].todo_seq);
                                    todoDownstairs(taskList[i].todo_seq, taskList[i + 1].todo_seq);
                                } else {
                                    alert("최하위 입니다~");
                                };
                            },
                            error: function (e) {
                                console.log('todoDown faild!');
                            }
                        });
                    };

                    // 다운 완료 
                    function todoDownstairs(todo_seq, todo_seq_1) {
                        console.log(todo_seq, todo_seq_1);
                        $.ajax({
                            url: "todoChange.do",
                            type: "post",
                            data: {
                                "todo_seq": todo_seq,
                                "todo_seq_1": todo_seq_1,
                            },
                            success: function (res) {
                                console.log("todoDownstairs complete!");
                                todoSearch();
                            },
                            error: function (e) {
                                console.log('todoDownstairs faild!');
                            }
                        });
                    };

                    // 수정 변수 선언 
                    let todo_seq;
                    const modal = document.getElementById("modal");
                    const modifyButton = document.getElementById("modify-button");

                    // 수정 열기
                    function todoModifyOpen(i) {
                        todo_seq = i;
                        console.log(todo_seq);
                        modal.style.display = "flex"
                    };

                    // 수정 esc 닫기 
                    window.addEventListener("keyup", e => {
                        if (modal.style.display === "flex" && e.key === "Escape") {
	                        modal.style.display = "none"
                        };
                    });
                    
                    // 수정 x 닫기
                    const closeBtn = modal.querySelector("#text-close");
                    closeBtn.addEventListener("click", e => {
                    	modal.style.display = "none"
                    });

                    // 수정 클릭 닫기
                    modal.addEventListener("click", e => {
                        const evTarget = e.target;
                        if (evTarget.classList.contains("modal-overlay")) {
	                        modal.style.display = "none"
                        };
                    });

                    // 수정 클릭 
                    modifyButton.addEventListener("click", e => {
                        if (($("#task-modify").val().trim() == "")) {
                            alert("수정할 To Do List 를 입력해주세요~");
                        } else {
                            todo_seq = todo_seq;
                            console.log(todo_seq);
                            todoModify(todo_seq);
                        };
                    });

                    // 수정 엔터
                    $("#task-modify").on("keydown", function (i) {
                        if (i.keyCode == 13) {
                            if (($("#task-modify").val().trim() == "")) {
                                alert("수정할 To Do List 를 입력해주세요~");
                            } else {
                                todo_seq = todo_seq;
                                console.log(todo_seq);
                                todoModify(todo_seq);
                                $("#task-input").prop("value", "");
                            };
                        };
                    });

                    // 수정 완료
                    function todoModify(todo_seq) {
                        console.log(todo_seq);
                        let todo_content = $("#task-modify").val();
                        console.log(todo_content);
                        $.ajax({
                            url: "todoModify.do",
                            type: "post",
                            data: {
                                "todo_seq": todo_seq,
                                "todo_content": todo_content
                            },
                            success: function (res) {
                                console.log("todoModify complete!");
                                todoSearch();
                            },
                            error: function (e) {
                                console.log('todoModify faild!');
                            }
                        });
                        modal.style.display = "none"
                        $("#task-modify").prop("value", "");
                    };


                    // 랜덤 루틴 변수 선언
                    let todorr_content;
                    let todorr_seq;

                    // 루틴 가져오기
                    function todoRandom(todo_seq) {
                        $.ajax({
                            url: "todoRrSelect.do",
                            dataType: 'json',
                            success: function (res) {
                                console.log("getCheering complete!");
                                const random = Math.floor(Math.random() * res.length);
                                console.log(random);
                                todorr_content = res[random].todorr_content;
                                todorr_seq = todo_seq;
                                todoRandomModify(todorr_seq, todorr_content);
                            },
                            error: function (e) {
                                console.log('getCheering faild!');
                            }
                        });

                    };

                    // 루틴 수정 완료
                    function todoRandomModify(todorr_seq, todorr_content) {
                        $.ajax({
                            url: "todoRandomModify.do",
                            type: "post",
                            data: {
                                "todorr_seq": todorr_seq,
                                "todorr_content": todorr_content
                            },
                            success: function (res) {
                                console.log("todoRandomModify complete!");
                                todoSearch();
                            },
                            error: function (e) {
                                console.log('todoRandomModify faild!');
                            }
                        });
                    };
                    
                    // 클릭
                    $("#add-button").on("click", function () {
                        if (($("#task-input").val().trim() == "")) {
                            alert("To Do List 를 입력해주세요~");
                        } else {
                            todoWrite();
                        };
                    });

                    // 엔터
                    $("#task-input").on("keydown", function (i) {
                        if (i.keyCode == 13) {
                            if (($("#task-input").val().trim() == "")) {
                                alert("To Do List 를 입력해주세요~");
                            } else {
                                todoWrite();
                                $("#task-input").prop("value", "");
                            };
                        };
                    });

                </script>

</body>

</html>
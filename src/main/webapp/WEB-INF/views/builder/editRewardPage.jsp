<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>mygoodsupporter</title>
    <link href="/dist/tailwind.css" rel="stylesheet">
<body>
<header class="text-gray-600 body-font">
    <nav class="container mx-auto flex flex-wrap p-5 justify-between items-center">
        <!-- Logo -->
        <div class="flex items-center title-font font-medium text-gray-900 mb-4 md:mb-0">
            <!-- Hamburger -->
            <button id="navbar-hamburger">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-10 h-10 text-white p-2 bg-yellow-400 rounded-full" viewBox="0 0 24 24">
                    <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"></path>
                </svg>
            </button>
            <span class="ml-3 text-xl">mygoodsupporter</span>
        </div>
        <!-- Menu -->
        <div class="hidden w-full order-last lg:flex lg:w-auto lg:order-none text-base"
             id="navbar-collapse-menu" >
            <a class="block mt-4 lg:inline-block lg:mt-0 lg:mr-5 hover:text-gray-900">진행중인 프로젝트</a>
            <a class="block mt-4 lg:inline-block lg:mt-0 lg:mr-5 hover:text-gray-900">오픈예정 프로젝트</a>
            <a class="block mt-4 lg:inline-block lg:mt-0 lg:mr-5 hover:text-gray-900" href="${pageContext.request.contextPath}/projects">모든 프로젝트</a>
            <a class="block mt-4 lg:inline-block lg:mt-0 lg:mr-5 hover:text-gray-900" href="projectRequestPage">프로젝트 신청</a>
        </div>
        <!-- CTA -->
        <div class="flex items-center mb-4 md:mb-0">
            <button class="inline-flex justify-center items-center bg-yellow-300 border-0 py-1 px-3 focus:outline-none hover:bg-yellow-400 rounded text-base text-white"><a href="login">로그인</a>
                <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-1" viewBox="0 0 24 24">
                    <path d="M5 12h14M12 5l7 7-7 7"></path>
                </svg>
            </button>
            &nbsp;
            <button class="inline-flex items-center bg-yellow-300 border-0 py-1 px-3 focus:outline-none hover:bg-yellow-300 rounded text-base text-white"><a href="memberJoinPage">회원가입</a>
                <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-1" viewBox="0 0 24 24">
                    <path d="M5 12h14M12 5l7 7-7 7"></path>
                </svg>
            </button>
        </div>
    </nav>
</header>

<main class="mt-0 lg:mt-12 text-gray-600 body-font">
    <section class="container mx-auto px-6">
        <div class="w-full md:flex md:flex-wrap lg:flex lg:flex-wrap justify-center items-center">
            <div class="bg-white">
                <nav class="flex flex-row sm:flex-row">
                    <button id="rewards-tab-button" class="text-gray-600 pb-2 px-4 block hover:text-yello-400 focus:outline-none focus:text-black-500 border-b-2 font-base border-yellow-400">
                        선물
                    </button>
                    <button id="items-tab-button" class="text-gray-600 pb-2 px-4 block hover:text-black focus:outline-none">
                        아이템
                    </button>
                </nav>
            </div>
            <div id="rewards-tab" class="bg-white flex flex-wrap flex-col">
                <div>
                    <h1 class="mt-4 text-lg">내가 만든 선물 <span>0</span></h1>
                </div>
            </div>
            <div id="items-tab" class="bg-white flex flex wrap flex-col">
                <div>
                    <h1 class="mt-4 text-lg">내가 만든 아이템 <span class="text-sm">0</span></h1>
                    <div class="mt-4 text-base border">
                        <h2 class="p-2">텀블러</h2>
                        <div class="p-2 border border-t">
                            <div class=text-xs>
                                <button>편집하기</button>
                                <button>삭제하기</button>
                            </div>
                        </div>
                    </div>
                </div>
                <button id="create-item-button" class="flex-grow p-2 mt-4 text-white bg-yellow-300 hover:bg-yellow-400 rounded">아이템 만들기</button>
                <div id="create-item-form" class="hidden">
                    <form class="flex flex-col">
                        <label class="block mt-4">아이템 이름</label>
                        <input type="text" class="block w-full mt-4 focus:outline-none focus:ring-1 focus:ring-yellow-300 focus:border-transparent">
                        <button class="flex-grow p-2 mt-4 text-white bg-yellow-300 hover:bg-yellow-400 rounded">아이템 등록</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
</main>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        let hamburger = document.querySelector('#navbar-hamburger')

        hamburger.addEventListener('click', () => {
            let menu = document.querySelector('#navbar-collapse-menu')
            menu.classList.toggle("hidden")
            menu.classList.toggle("block")
        })

        let rewardsTabButton = document.querySelector('#rewards-tab-button')
        rewardsTabButton.addEventListener('click', () => {
            let rewardsTab = document.querySelector('#rewards-tab')
            rewardsTab.classList.toggle('hidden')
            let itemsTab = document.querySelector('#items-tab')
            itemsTab.classList.toggle('hidden')
        })

        // let itemTabButton = document.querySelector.querySelector('#items-tab-button')
        // itemTabButton.addEventListener('click', () => {
        //   let rewardsTab = document.querySelector('#rewards-tab')
        //   rewardsTab.classList.toggle('hidden')
        //   let itemsTab = document.querySelector('#items-tab')
        //   itemsTab.classList.toggle('hidden')
        // })

        let createItemButton = document.querySelector('#create-item-button')
        createItemButton.addEventListener('click', () => {
            let createItemForm = document.querySelector('#create-item-form')
            console.log("toggle")
            createItemForm.classList.toggle("hidden")
        })
    })

</script>
</body>
</html>
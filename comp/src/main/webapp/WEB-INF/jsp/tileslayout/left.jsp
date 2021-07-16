<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


 <!-- Sidebar - Brand -->
 <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/main.do">
     <div class="sidebar-brand-icon rotate-n-15">
         <i class="fas fa-laugh-wink"></i>
     </div>
     <div class="sidebar-brand-text mx-3">MES</div>
 </a>

 <!-- Divider -->
 <hr class="sidebar-divider my-0">

 <!-- Nav Item - Dashboard -->
 <li class="nav-item active">
     <a class="nav-link" href="${pageContext.request.contextPath}/main.do">
         <i class="fas fa-fw fa-tachometer-alt"></i>
         <span>메인</span></a>
 </li>

 <!-- Divider -->
 <hr class="sidebar-divider">

 <!-- Nav Item - Pages Collapse Menu -->
 <li class="nav-item">
     <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
         <i class="fas fa-fw fa-cog"></i>
         <span>기준정보관리</span>
     </a>
     <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
         <div class="bg-white py-2 collapse-inner rounded">
             <a class="collapse-item" href="${pageContext.request.contextPath}/comm/commonCodeForm.do">공통코드관리</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/comm/matForm.do">자재정보관리</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/comm/bomList.do">제품 BOM관리</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/comm/processList.do">공정관리</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/comm/empList.do">사원관리</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/comm/error.do">불량코드 관리 </a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/comm/QualityControl.do">제품 품질 표준서 관리</a>
         </div>
     </div>
 </li>

 <!-- Nav Item - Utilities Collapse Menu -->
 <li class="nav-item">
     <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
         <i class="fas fa-fw fa-wrench"></i>
         <span>영업관리</span>
     </a>
     <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
         <div class="bg-white py-2 collapse-inner rounded">
             <a class="collapse-item" href="${pageContext.request.contextPath}/bus/view/busList.do">주문관리 참조조회</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/bus/mng/exportForm.do">출고 관리</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/bus/view/viewExport.do">출고 조회</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/bus/view/productInventory.do">제품 재고 조회</a>
         </div>
     </div>
 </li>

 <!-- Nav Item - Pages Collapse Menu -->
 <li class="nav-item">
     <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
         <i class="fas fa-fw fa-folder"></i>
         <span>자재관리</span>
     </a>
     <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
         <div class="bg-white py-2 collapse-inner rounded">
             <a class="collapse-item" href="${pageContext.request.contextPath}/mat/view/inorderList.do">발주 조회</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/mat/view/matInList.do">자재입고 조회</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/mat/mng/matInForm.do">자재입고 관리</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/mat/view/matOutList.do">자재출고 조회</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/mat/mng/matOutForm.do">자재출고 관리</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/mat/view/matAdjustList.do">자재재고조정 전표 조회</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/mat/mng/matAdjustForm.do">자재재고조정 전표 관리</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/mat/mng/matAdjustWrite.do">자재재고조정 전표 작성</a>
         </div>
     </div>
 </li>


	<!-- Nav Item - Pages Collapse Menu -->
 <li class="nav-item">
     <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages2" aria-expanded="true" aria-controls="collapsePages2">
         <i class="fas fa-fw fa-folder"></i>
         <span>생산관리</span>
     </a>
     <div id="collapsePages2" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
         <div class="bg-white py-2 collapse-inner rounded">
             <a class="collapse-item" href="${pageContext.request.contextPath}/pro/mng/managePlan.do">생산계획 관리</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/pro/view/viewPlan.do">생산계획 조회</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/pro/mng/manageProrder.do">생산지시 관리</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/pro/view/viewProrder.do">생산지시 조회</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/pro/view/procMovePrint.do">공정이동표 발행</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/pro/view/manageWork.do">작업실적 관리</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/pro/view/viewWork.do">작업실적 조회</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/pro/view/prodMonitoring.do">생산 모니터링</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/pro/view/detailErrorList.do">불량내역 조회</a>
         </div>
     </div>
 </li>

	<!-- Nav Item - Pages Collapse Menu -->
 <li class="nav-item">
     <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages3" aria-expanded="true" aria-controls="collapsePages3">
         <i class="fas fa-fw fa-folder"></i>
         <span>설비관리</span>
     </a>
     <div id="collapsePages3" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
         <div class="bg-white py-2 collapse-inner rounded">
             <a class="collapse-item" href="${pageContext.request.contextPath}/fac/mng/facAdmin.do">설비 관리</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/fac/view/facList.do">설비 조회</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/fac/mng/repList.do">설비 수리내역 관리</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/fac/view/repairList.do">설비 수리내역 조회</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/fac/mng/inspection.do">설비 점검내역 관리</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/fac/view/inspectionList.do">설비 점검내역 조회</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/fac/view/facProdList.do">설비 생산이력 조회</a>
         </div>
     </div>
 </li>
	<!-- Nav Item - Pages Collapse Menu -->
 <li class="nav-item">
     <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages4" aria-expanded="true" aria-controls="collapsePages4">
         <i class="fas fa-fw fa-folder"></i>
         <span>사용자 권한 관리</span>
     </a>
     <div id="collapsePages4" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
         <div class="bg-white py-2 collapse-inner rounded">
             <a class="collapse-item" href="${pageContext.request.contextPath}/sec/rmt/EgovRoleList.do">롤 관리</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/sec/ram/EgovAuthorList.do">권한 관리</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/sec/rgm/EgovAuthorGroupList.do">권한 그룹 관리</a>
         </div>
     </div>
 </li>
 	<!-- Nav Item - Pages Collapse Menu -->
 <li class="nav-item">
     <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages5" aria-expanded="true" aria-controls="collapsePages5">
         <i class="fas fa-fw fa-folder"></i>
         <span>프로그램/메뉴관리</span>
     </a>
     <div id="collapsePages5" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
         <div class="bg-white py-2 collapse-inner rounded">
             <a class="collapse-item" href="#">프로그램 관리</a>
             <a class="collapse-item" href="#">메뉴 관리</a>
         </div>
     </div>
 </li>
 <!-- Divider -->
	<hr class="sidebar-divider">

 <!-- Sidebar Toggler (Sidebar) -->
 <div class="text-center d-none d-md-inline">
     <button class="rounded-circle border-0" id="sidebarToggle"></button>
 </div>



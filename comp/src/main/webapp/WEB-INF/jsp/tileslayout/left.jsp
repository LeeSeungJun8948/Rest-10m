<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


 <!-- Sidebar - Brand -->
 <a class="sidebar-brand d-flex align-items-center justify-content-center" href="main.do">
     <div class="sidebar-brand-icon rotate-n-15">
         <i class="fas fa-laugh-wink"></i>
     </div>
     <div class="sidebar-brand-text mx-3">MES</div>
 </a>

 <!-- Divider -->
 <hr class="sidebar-divider my-0">

 <!-- Nav Item - Dashboard -->
 <li class="nav-item active">
     <a class="nav-link" href="main.do">
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
             <a class="collapse-item" href="/comp/sym/ccm/cca/SelectCcmCmmnCodeList.do">공통코드관리-마스터</a>
             <a class="collapse-item" href="/comp/sym/ccm/cde/SelectCcmCmmnDetailCodeList.do">공통코드관리-상세</a>
             <a class="collapse-item" href="/comp/matForm.do">자재정보관리</a>
             <a class="collapse-item" href="/comp/bomList.do">제품 BOM관리</a>
             <a class="collapse-item" href="/comp/processList.do">공정관리</a>
             <a class="collapse-item" href="/comp/empList.do">사원관리</a>
             <a class="collapse-item" href="/comp/error.do">불량코드 관리 </a>
             <a class="collapse-item" href="/comp/QualityControl.do">제품 품질 표준서 관리</a>

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
             <a class="collapse-item" href="/comp/busList.do">주문관리 참조조회</a>
             <a class="collapse-item" href="/comp/exportForm.do">출고 관리</a>
             <a class="collapse-item" href="/comp/productInventory.do">제품 재고 조회</a>
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
             <a class="collapse-item" href="/comp/inorderForm.do">발주 조회</a>
             <a class="collapse-item" href="/comp/matInForm.do">자재입고 관리</a>
             <a class="collapse-item" href="/comp/matOutForm.do">자재출고 관리</a>
             <a class="collapse-item" href="/comp/matAdjustList.do">자재재고조정 전표 관리</a>
             <a class="collapse-item" href="/comp/matAdjustForm.do">자재재고조정 전표 작성</a>
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
             <a class="collapse-item" href="/comp/managePlan.do">생산계획 관리</a>
             <a class="collapse-item" href="/comp/viewPlan.do">생산계획 조회</a>
             <a class="collapse-item" href="/comp/manageProrder.do">생산지시 관리</a>
             <a class="collapse-item" href="/comp/viewProrder.do">생산지시 조회</a>
             <a class="collapse-item" href="/comp/procMovePrint.do">공정이동표 발행</a>
             <a class="collapse-item" href="/comp/manageWork.do">작업실적 관리</a>
             <a class="collapse-item" href="/comp/viewWork.do">작업실적 조회</a>
             <a class="collapse-item" href="/comp/detailErrorList.do">불량내역 조회</a>
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
             <a class="collapse-item" href="/comp/facAdmin.do">설비 관리</a>
             <a class="collapse-item" href="/comp/facList.do">설비 조회</a>
             <a class="collapse-item" href="/comp/repList.do">설비 수리내역 관리</a>
             <a class="collapse-item" href="/comp/inspection.do">설비 점검내역 관리</a>
             <a class="collapse-item" href="/comp/facProdList.do">설비생산이력 조회</a>
         </div>
     </div>
 </li>

 <!-- Divider -->
	<hr class="sidebar-divider">

 <!-- Sidebar Toggler (Sidebar) -->
 <div class="text-center d-none d-md-inline">
     <button class="rounded-circle border-0" id="sidebarToggle"></button>
 </div>



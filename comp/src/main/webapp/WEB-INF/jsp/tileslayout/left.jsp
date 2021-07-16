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
         <span>����</span></a>
 </li>

 <!-- Divider -->
 <hr class="sidebar-divider">

 <!-- Nav Item - Pages Collapse Menu -->
 <li class="nav-item">
     <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
         <i class="fas fa-fw fa-cog"></i>
         <span>������������</span>
     </a>
     <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
         <div class="bg-white py-2 collapse-inner rounded">
             <a class="collapse-item" href="${pageContext.request.contextPath}/comm/commonCodeForm.do">�����ڵ����</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/comm/matForm.do">������������</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/comm/bomList.do">��ǰ BOM����</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/comm/processList.do">��������</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/comm/empList.do">�������</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/comm/error.do">�ҷ��ڵ� ���� </a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/comm/QualityControl.do">��ǰ ǰ�� ǥ�ؼ� ����</a>
         </div>
     </div>
 </li>

 <!-- Nav Item - Utilities Collapse Menu -->
 <li class="nav-item">
     <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
         <i class="fas fa-fw fa-wrench"></i>
         <span>��������</span>
     </a>
     <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
         <div class="bg-white py-2 collapse-inner rounded">
             <a class="collapse-item" href="${pageContext.request.contextPath}/bus/view/busList.do">�ֹ����� ������ȸ</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/bus/mng/exportForm.do">��� ����</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/bus/view/viewExport.do">��� ��ȸ</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/bus/view/productInventory.do">��ǰ ��� ��ȸ</a>
         </div>
     </div>
 </li>

 <!-- Nav Item - Pages Collapse Menu -->
 <li class="nav-item">
     <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
         <i class="fas fa-fw fa-folder"></i>
         <span>�������</span>
     </a>
     <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
         <div class="bg-white py-2 collapse-inner rounded">
             <a class="collapse-item" href="${pageContext.request.contextPath}/mat/view/inorderList.do">���� ��ȸ</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/mat/view/matInList.do">�����԰� ��ȸ</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/mat/mng/matInForm.do">�����԰� ����</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/mat/view/matOutList.do">������� ��ȸ</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/mat/mng/matOutForm.do">������� ����</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/mat/view/matAdjustList.do">����������� ��ǥ ��ȸ</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/mat/mng/matAdjustForm.do">����������� ��ǥ ����</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/mat/mng/matAdjustWrite.do">����������� ��ǥ �ۼ�</a>
         </div>
     </div>
 </li>


	<!-- Nav Item - Pages Collapse Menu -->
 <li class="nav-item">
     <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages2" aria-expanded="true" aria-controls="collapsePages2">
         <i class="fas fa-fw fa-folder"></i>
         <span>�������</span>
     </a>
     <div id="collapsePages2" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
         <div class="bg-white py-2 collapse-inner rounded">
             <a class="collapse-item" href="${pageContext.request.contextPath}/pro/mng/managePlan.do">�����ȹ ����</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/pro/view/viewPlan.do">�����ȹ ��ȸ</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/pro/mng/manageProrder.do">�������� ����</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/pro/view/viewProrder.do">�������� ��ȸ</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/pro/view/procMovePrint.do">�����̵�ǥ ����</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/pro/view/manageWork.do">�۾����� ����</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/pro/view/viewWork.do">�۾����� ��ȸ</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/pro/view/prodMonitoring.do">���� ����͸�</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/pro/view/detailErrorList.do">�ҷ����� ��ȸ</a>
         </div>
     </div>
 </li>

	<!-- Nav Item - Pages Collapse Menu -->
 <li class="nav-item">
     <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages3" aria-expanded="true" aria-controls="collapsePages3">
         <i class="fas fa-fw fa-folder"></i>
         <span>�������</span>
     </a>
     <div id="collapsePages3" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
         <div class="bg-white py-2 collapse-inner rounded">
             <a class="collapse-item" href="${pageContext.request.contextPath}/fac/mng/facAdmin.do">���� ����</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/fac/view/facList.do">���� ��ȸ</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/fac/mng/repList.do">���� �������� ����</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/fac/view/repairList.do">���� �������� ��ȸ</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/fac/mng/inspection.do">���� ���˳��� ����</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/fac/view/inspectionList.do">���� ���˳��� ��ȸ</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/fac/view/facProdList.do">���� �����̷� ��ȸ</a>
         </div>
     </div>
 </li>
	<!-- Nav Item - Pages Collapse Menu -->
 <li class="nav-item">
     <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages4" aria-expanded="true" aria-controls="collapsePages4">
         <i class="fas fa-fw fa-folder"></i>
         <span>����� ���� ����</span>
     </a>
     <div id="collapsePages4" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
         <div class="bg-white py-2 collapse-inner rounded">
             <a class="collapse-item" href="${pageContext.request.contextPath}/sec/rmt/EgovRoleList.do">�� ����</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/sec/ram/EgovAuthorList.do">���� ����</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/sec/rgm/EgovAuthorGroupList.do">���� �׷� ����</a>
         </div>
     </div>
 </li>
 	<!-- Nav Item - Pages Collapse Menu -->
 <li class="nav-item">
     <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages5" aria-expanded="true" aria-controls="collapsePages5">
         <i class="fas fa-fw fa-folder"></i>
         <span>���α׷�/�޴�����</span>
     </a>
     <div id="collapsePages5" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
         <div class="bg-white py-2 collapse-inner rounded">
             <a class="collapse-item" href="#">���α׷� ����</a>
             <a class="collapse-item" href="#">�޴� ����</a>
         </div>
     </div>
 </li>
 <!-- Divider -->
	<hr class="sidebar-divider">

 <!-- Sidebar Toggler (Sidebar) -->
 <div class="text-center d-none d-md-inline">
     <button class="rounded-circle border-0" id="sidebarToggle"></button>
 </div>



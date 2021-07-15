<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


 <!-- Sidebar - Brand -->
 <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/pro/view/main.do">
     <div class="sidebar-brand-icon rotate-n-15">
         <i class="fas fa-laugh-wink"></i>
     </div>
     <div class="sidebar-brand-text mx-3">MES</div>
 </a>

 <!-- Divider -->
 <hr class="sidebar-divider my-0">

 <!-- Nav Item - Dashboard -->
 <li class="nav-item active">
     <a class="nav-link" href="${pageContext.request.contextPath}/pro/view/main.do">
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
             <a class="collapse-item" href="${pageContext.request.contextPath}/commonCodeForm.do">�����ڵ����</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/matForm.do">������������</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/bomList.do">��ǰ BOM����</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/processList.do">��������</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/empList.do">�������</a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/error.do">�ҷ��ڵ� ���� </a>
             <a class="collapse-item" href="${pageContext.request.contextPath}/QualityControl.do">��ǰ ǰ�� ǥ�ؼ� ����</a>
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
             <a class="collapse-item" href="busList.do">�ֹ����� ������ȸ</a>
             <a class="collapse-item" href="exportForm.do">��� ����</a>
             <a class="collapse-item" href="viewExport.do">��� ��ȸ</a>
             <a class="collapse-item" href="productInventory.do">��ǰ ��� ��ȸ</a>
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
             <a class="collapse-item" href="facAdmin.do">���� ����</a>
             <a class="collapse-item" href="facList.do">���� ��ȸ</a>
             <a class="collapse-item" href="repList.do">���� �������� ����</a>
             <a class="collapse-item" href="repairList.do">���� �������� ��ȸ</a>
             <a class="collapse-item" href="inspection.do">���� ���˳��� ����</a>
             <a class="collapse-item" href="inspectionList.do">���� ���˳��� ��ȸ</a>
             <a class="collapse-item" href="facProdList.do">���� �����̷� ��ȸ</a>
         </div>
     </div>
 </li>

 <!-- Divider -->
	<hr class="sidebar-divider">

 <!-- Sidebar Toggler (Sidebar) -->
 <div class="text-center d-none d-md-inline">
     <button class="rounded-circle border-0" id="sidebarToggle"></button>
 </div>



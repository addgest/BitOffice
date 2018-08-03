<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="app-title">
        <div>
          <h1>회의실별 예약 현황</h1>
        </div>
      </div>
	<c:set var="i" value="0" />
	<c:forEach var="reservation" items="${list}">
	<c:set var="i" value="${ i+1 }" />
	</c:forEach>
 
<div class="row">
     <div class="col-md-6">
          <div class="tile">

            <table class="table table-hover">
              <thead>
                <tr>
					<th colspan="6">XX일</th>
					<th colspan="5"></th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>9:00-10:00</td>
                  <td>10:00-11:00</td>
                  <td>11:00-12:00</td>
                  <td>12:00-13:00</td>
                </tr>
                <tr>
                  <td>13:00-14:00</td>
                  <td>14:00-15:00</td>
                  <td>15:00-16:00</td>
                  <td>16:00-17:00</td>
                </tr>
                <tr>
                  <td>17:00-18:00</td>
                  <td>18:00-19:00</td>
                  <td>19:00-20:00</td>
                  <td>20:00-21:00</td>
                </tr>
                
              </tbody>
            </table>
          </div>
        </div>
     
     <div class="col-md-6">
          <div class="tile">

            <table class="table table-hover">
              <thead>
                <tr>
					<th colspan="6">XX일</th>
					<th colspan="5"></th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>9:00-10:00</td>
                  <td>10:00-11:00</td>
                  <td>11:00-12:00</td>
                  <td>12:00-13:00</td>
                </tr>
                <tr>
                  <td>13:00-14:00</td>
                  <td>14:00-15:00</td>
                  <td>15:00-16:00</td>
                  <td>16:00-17:00</td>
                </tr>
                <tr>
                  <td>17:00-18:00</td>
                  <td>18:00-19:00</td>
                  <td>19:00-20:00</td>
                  <td>20:00-21:00</td>
                </tr>
                
              </tbody>
            </table>
          </div>
        </div>
        
     <div class="col-md-6">
          <div class="tile">

            <table class="table table-hover">
              <thead>
                <tr>
					<th colspan="6">XX일</th>
					<th colspan="5"></th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>9:00-10:00</td>
                  <td>10:00-11:00</td>
                  <td>11:00-12:00</td>
                  <td>12:00-13:00</td>
                </tr>
                <tr>
                  <td>13:00-14:00</td>
                  <td>14:00-15:00</td>
                  <td>15:00-16:00</td>
                  <td>16:00-17:00</td>
                </tr>
                <tr>
                  <td>17:00-18:00</td>
                  <td>18:00-19:00</td>
                  <td>19:00-20:00</td>
                  <td>20:00-21:00</td>
                </tr>
                
              </tbody>
            </table>
          </div>
        </div>
        
     <div class="col-md-6">
          <div class="tile">

            <table class="table table-hover">
              <thead>
                <tr>
					<th colspan="6">XX일</th>
					<th colspan="5"></th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>9:00-10:00</td>
                  <td>10:00-11:00</td>
                  <td>11:00-12:00</td>
                  <td>12:00-13:00</td>
                </tr>
                <tr>
                  <td>13:00-14:00</td>
                  <td>14:00-15:00</td>
                  <td>15:00-16:00</td>
                  <td>16:00-17:00</td>
                </tr>
                <tr>
                  <td>17:00-18:00</td>
                  <td>18:00-19:00</td>
                  <td>19:00-20:00</td>
                  <td>20:00-21:00</td>
                </tr>
                
              </tbody>
            </table>
          </div>
        </div>
</div>


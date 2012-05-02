package tests {
import data.PointData;
import data.PointDataNode;
import data.PointNode;

import lists.DataExtendsNodeList;
import lists.DataIsNodeList;
import lists.NoNodeList;
import lists.NodeContainsDataList;

import com.gskinner.performance.MethodTest;
import com.gskinner.performance.TestSuite;

public class RemoveItemsTest extends TestSuite {
	private var loops:uint = 50000;
	
	private var rawData:Vector.<PointData>;
	private var rawNode:Vector.<PointNode>;
	private var rawDataNode:Vector.<PointDataNode>;
	
	private var array:Array;
	private var vector:Vector.<PointData>;
	private var dataExtendsNodeList:DataExtendsNodeList;
	private var dataIsNodeList:DataIsNodeList;
	private var nodeContainsDataList:NodeContainsDataList;
	private var noNodeList:NoNodeList;
	
	public function RemoveItemsTest() {
		name = "Remove Items Test";
		tareTest = new MethodTest(tare);
		iterations = 1;
		tests = [ //
			new MethodTest(testArrayRemove, null, "testArrayRemove", 0, 1, "Array remove"), //
			new MethodTest(testVectorRemove, null, "testVectorRemove", 0, 1, "Vector remove"), //
			new MethodTest(testNodeContainsDataListRemove, null, "testNodeContainsDataListRemove", 0, 1, "NodeContainsDataList remove"), //
			new MethodTest(testDataExtendsNodeListRemove, null, "testDataExtendsNodeListRemove", 0, 1, "DataExtendsNodeList remove"), //
			new MethodTest(testDataIsNodeListRemove, null, "testDataIsNodeListRemove", 0, 1, "DataIsNodeList remove"), //
			new MethodTest(testNoNodeListRemove, null, "testNoNodeListRemove", 0, 1, "NoNodeList remove"), //
			];
		init();
	}
	
	private function init():void {
		rawData = new Vector.<PointData>();
		rawNode = new Vector.<PointNode>();
		rawDataNode = new Vector.<PointDataNode>();
		
		array = new Array();
		vector = new Vector.<PointData>();
		dataExtendsNodeList = new DataExtendsNodeList();
		dataIsNodeList = new DataIsNodeList();
		nodeContainsDataList = new NodeContainsDataList();
		noNodeList = new NoNodeList();
		
		for (var i:uint = 0; i < loops; i++) {
			var pd:PointData = new PointData();
			var pn:PointNode = new PointNode();
			var pdn:PointDataNode = new PointDataNode();
			
			array.push(pd);
			vector.push(pd);
			dataExtendsNodeList.add(pdn);
			dataIsNodeList.add(pn);
			nodeContainsDataList.add(pd);
			noNodeList.add(pd);
			
			rawData.push(pd);
			rawNode.push(pn);
			rawDataNode.push(pdn);
		}
		
		for (i = 0; i < loops; ++i) {
			var pos:int = int(Math.random() * loops * iterations);
			
			var temp1:PointData = rawData[pos];
			rawData[pos] = rawData[i];
			rawData[i] = temp1;
			
			var temp2:PointNode = rawNode[pos];
			rawNode[pos] = rawNode[i];
			rawNode[i] = temp2;
			
			var temp3:PointDataNode = rawDataNode[pos];
			rawDataNode[pos] = rawDataNode[i];
			rawDataNode[i] = temp3;
		}
	}
	
	public function tare():void {
		var data:PointData;
		for (var i:uint = 0; i < loops; i++) {
			data = rawData[i];
		}
	}
	
	public function testArrayRemove():void {
		var data:PointData;
		for (var i:uint = 0; i < loops; i++) {
			data = rawData[i];
			var index:int = array.indexOf(data);
			if (index != -1) {
				array.splice(index, 1);
			}
		}
	}
	
	public function testVectorRemove():void {
		var data:PointData;
		for (var i:uint = 0; i < loops; i++) {
			data = rawData[i];
			var index:int = vector.indexOf(data);
			if (index != -1) {
				vector.splice(index, 1);
			}
		}
	}
	
	public function testDataExtendsNodeListRemove():void {
		for (var i:uint = 0; i < loops; i++) {
			dataExtendsNodeList.remove(rawDataNode[i]);
		}
	}
	
	public function testDataIsNodeListRemove():void {
		for (var i:uint = 0; i < loops; i++) {
			dataIsNodeList.remove(rawNode[i]);
		}
	}
	
	public function testNodeContainsDataListRemove():void {
		for (var i:uint = 0; i < loops; i++) {
			nodeContainsDataList.remove(rawData[i]);
		}
	}
	
	public function testNoNodeListRemove():void {
		for (var i:uint = 0; i < loops; i++) {
			noNodeList.remove(rawData[i]);
		}
	}
}
}

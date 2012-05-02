package {
import flash.events.DataEvent;
import flash.events.Event;
import flash.system.Capabilities;
import tests.AddItemsTest;
import tests.LoopItemsTest;
import tests.RemoveItemsTest;

import com.gskinner.performance.PerformanceTest;

import flash.display.Sprite;
import flash.text.TextField;

[SWF(width='800',height='600',frameRate='30',backgroundColor='#FFFFFF')]

public class PerformanceTestRunner extends Sprite {
	private var out:TextField;
	private var performanceTest:PerformanceTest;
	
	public function PerformanceTestRunner() {
		out = new TextField();
		out.width = stage.stageWidth;
		out.height = stage.stageHeight;
		addChild(out);
		
		performanceTest = PerformanceTest.getInstance();
		
		performanceTest.delay = 100;
		
		performanceTest.addEventListener(Event.COMPLETE, handleComplete);
		performanceTest.addEventListener(Event.CLOSE, handleAllComplete);
		
		queueTests();
		
		out.appendText("Running tests on " + Capabilities.version + " " + (Capabilities.isDebugger ? "DEBUG" : "RELEASE") + "\n");

	}
	
	private function queueTests():void {
		PerformanceTest.queue(new AddItemsTest());
		PerformanceTest.queue(new RemoveItemsTest());
		PerformanceTest.queue(new LoopItemsTest());
	}
	
	private function handleComplete(event:Event):void {
		out.appendText(performanceTest.currentTest.name + ":" + "\t" + ((performanceTest.currentTest.time - performanceTest.currentTestSuite.tareTime) / performanceTest.currentTest.loops) + "\t" + performanceTest.currentTest.toString() + "\n");
	}
	
	private function handleAllComplete(event:Event):void {
		out.appendText("DONE.");
	}
}
}

package events
{
   import buttons.§_-uH§;
   import flash.events.Event;
   
   public class §_-b2G§ extends Event
   {
      
      public static const SELECT:String = "ButtonRadioSelect";
      
      public static const CHANGE:String = "ButtonRadioChange";
      
      public static const CLICK:String = "ButtonRadioClick";
      
      public var button:§_-uH§;
      
      public function §_-b2G§(param1:String, param2:§_-uH§ = null)
      {
         super(param1);
         this.button = param2;
      }
   }
}


package events
{
   import buttons.§_-F1F§;
   import flash.events.Event;
   
   public class §_-4Y§ extends Event
   {
      
      public static const SELECT:String = "ButtonRadioSelect";
      
      public static const CHANGE:String = "ButtonRadioChange";
      
      public static const CLICK:String = "ButtonRadioClick";
      
      public var button:§_-F1F§;
      
      public function §_-4Y§(param1:String, param2:§_-F1F§ = null)
      {
         super(param1);
         this.button = param2;
      }
   }
}


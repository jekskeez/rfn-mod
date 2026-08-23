package §_-r2Y§
{
   import flash.events.Event;
   import tape.§_-K2k§;
   
   public class §_-33e§ extends Event
   {
      
      public static const SELECTED:String = "SELECTED";
      
      public static const DESELECTED:String = "DESELECTED";
      
      public static const STICKED:String = "STICKED";
      
      public static const CHANGED:String = "CHANGED";
      
      public static const DRESSED:String = "DRESSED";
      
      public static const UNDRESSED:String = "UNDRESSED";
      
      public var element:§_-K2k§;
      
      public function §_-33e§(param1:§_-K2k§, param2:String = "SELECTED")
      {
         super(param2);
         this.element = param1;
      }
   }
}


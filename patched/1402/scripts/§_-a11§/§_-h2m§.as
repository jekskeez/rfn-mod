package §_-a11§
{
   import flash.events.Event;
   import tape.§_-QN§;
   
   public class §_-h2m§ extends Event
   {
      
      public static const SELECTED:String = "SELECTED";
      
      public static const DESELECTED:String = "DESELECTED";
      
      public static const STICKED:String = "STICKED";
      
      public static const CHANGED:String = "CHANGED";
      
      public static const DRESSED:String = "DRESSED";
      
      public static const UNDRESSED:String = "UNDRESSED";
      
      public var element:§_-QN§;
      
      public function §_-h2m§(param1:§_-QN§, param2:String = "SELECTED")
      {
         super(param2);
         this.element = param1;
      }
   }
}


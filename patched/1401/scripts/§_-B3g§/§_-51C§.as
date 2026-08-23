package §_-B3g§
{
   import flash.events.Event;
   
   public class §_-51C§ extends Event
   {
      
      public static const COMPLETE:String = "complete";
      
      public static const START:String = "start";
      
      public static const UPDATE:String = "change";
      
      public static const §_-Jg§:String = "reverseComplete";
      
      public static const INIT:String = "init";
      
      public static const VERSION:Number = 1.1;
      
      public static const §_-B3X§:String = "repeat";
      
      public function §_-51C§(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new §_-51C§(this.type,this.bubbles,this.cancelable);
      }
   }
}


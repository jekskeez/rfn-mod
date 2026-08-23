package §_-Z1Y§
{
   import flash.events.Event;
   
   public class §_-111§ extends Event
   {
      
      public static const COMPLETE:String = "complete";
      
      public static const START:String = "start";
      
      public static const UPDATE:String = "change";
      
      public static const §_-R2Z§:String = "reverseComplete";
      
      public static const INIT:String = "init";
      
      public static const VERSION:Number = 1.1;
      
      public static const §_-83R§:String = "repeat";
      
      public function §_-111§(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new §_-111§(this.type,this.bubbles,this.cancelable);
      }
   }
}


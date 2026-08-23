package §_-K2c§
{
   public class KeyboardEvent extends Event
   {
      
      public static const KEY_UP:String = "keyUp";
      
      public static const KEY_DOWN:String = "keyDown";
      
      private var §_-7B§:uint;
      
      private var §_-wz§:uint;
      
      private var §_-Nb§:uint;
      
      private var §_-D2J§:Boolean;
      
      private var §_-u2i§:Boolean;
      
      private var §_-41B§:Boolean;
      
      private var §_-e22§:Boolean;
      
      public function KeyboardEvent(param1:String, param2:uint = 0, param3:uint = 0, param4:uint = 0, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,false,param3);
         this.§_-7B§ = param2;
         this.§_-wz§ = param3;
         this.§_-Nb§ = param4;
         this.§_-u2i§ = param5;
         this.§_-D2J§ = param6;
         this.§_-41B§ = param7;
      }
      
      public function preventDefault() : void
      {
         this.§_-e22§ = true;
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.§_-e22§;
      }
      
      public function get charCode() : uint
      {
         return this.§_-7B§;
      }
      
      public function get keyCode() : uint
      {
         return this.§_-wz§;
      }
      
      public function get keyLocation() : uint
      {
         return this.§_-Nb§;
      }
      
      public function get altKey() : Boolean
      {
         return this.§_-D2J§;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.§_-u2i§;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.§_-41B§;
      }
   }
}


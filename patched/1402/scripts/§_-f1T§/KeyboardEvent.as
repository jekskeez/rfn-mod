package §_-f1T§
{
   public class KeyboardEvent extends Event
   {
      
      public static const KEY_UP:String = "keyUp";
      
      public static const KEY_DOWN:String = "keyDown";
      
      private var §_-mo§:uint;
      
      private var §_-33i§:uint;
      
      private var §_-P1A§:uint;
      
      private var §_-I2F§:Boolean;
      
      private var §_-31D§:Boolean;
      
      private var §_-W28§:Boolean;
      
      private var §_-033§:Boolean;
      
      public function KeyboardEvent(param1:String, param2:uint = 0, param3:uint = 0, param4:uint = 0, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,false,param3);
         this.§_-mo§ = param2;
         this.§_-33i§ = param3;
         this.§_-P1A§ = param4;
         this.§_-31D§ = param5;
         this.§_-I2F§ = param6;
         this.§_-W28§ = param7;
      }
      
      public function preventDefault() : void
      {
         this.§_-033§ = true;
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.§_-033§;
      }
      
      public function get charCode() : uint
      {
         return this.§_-mo§;
      }
      
      public function get keyCode() : uint
      {
         return this.§_-33i§;
      }
      
      public function get keyLocation() : uint
      {
         return this.§_-P1A§;
      }
      
      public function get altKey() : Boolean
      {
         return this.§_-I2F§;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.§_-31D§;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.§_-W28§;
      }
   }
}


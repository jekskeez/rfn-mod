package §_-X1k§
{
   import flash.display.DisplayObject;
   import flash.utils.getDefinitionByName;
   
   public class §_-VZ§
   {
      
      private var §_-n2x§:int = 0;
      
      private var §_-S2s§:int = 0;
      
      private var _name:String = null;
      
      private var §_-31x§:Number = 0;
      
      private var §_-i2P§:int = 0;
      
      private var §_-73h§:String = null;
      
      private var §_-b18§:String = "";
      
      private var §_-kA§:Vector.<§_-73B§> = null;
      
      public function §_-VZ§(param1:int, param2:int, param3:String, param4:Number, param5:int, param6:String, param7:String, param8:Vector.<§_-73B§>)
      {
         super();
         this.§_-n2x§ = param1;
         this.§_-S2s§ = param2;
         this._name = param3;
         this.§_-31x§ = param4;
         this.§_-i2P§ = param5;
         this.§_-b18§ = param6;
         this.§_-73h§ = param7;
         this.§_-kA§ = param8;
      }
      
      public function get id() : int
      {
         return this.§_-n2x§;
      }
      
      public function get rewardId() : int
      {
         return this.§_-S2s§;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get price() : Number
      {
         return this.§_-31x§;
      }
      
      public function get §_-52M§() : int
      {
         return this.§_-i2P§;
      }
      
      public function get §_-T1U§() : String
      {
         return this.§_-b18§;
      }
      
      public function get image() : DisplayObject
      {
         var _loc1_:Class = getDefinitionByName(this.§_-73h§) as Class;
         return new _loc1_();
      }
      
      public function get §_-71h§() : Vector.<§_-73B§>
      {
         return this.§_-kA§;
      }
   }
}


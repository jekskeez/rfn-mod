package §_-I10§
{
   import flash.display.DisplayObject;
   import flash.utils.getDefinitionByName;
   
   public class §_-63q§
   {
      
      private var §_-4A§:int = 0;
      
      private var §_-w1J§:int = 0;
      
      private var _name:String = null;
      
      private var §_-yQ§:Number = 0;
      
      private var §_-wy§:int = 0;
      
      private var §_-S1L§:String = null;
      
      private var §_-m1o§:String = "";
      
      private var §_-k1W§:Vector.<§_-51T§> = null;
      
      public function §_-63q§(param1:int, param2:int, param3:String, param4:Number, param5:int, param6:String, param7:String, param8:Vector.<§_-51T§>)
      {
         super();
         this.§_-4A§ = param1;
         this.§_-w1J§ = param2;
         this._name = param3;
         this.§_-yQ§ = param4;
         this.§_-wy§ = param5;
         this.§_-m1o§ = param6;
         this.§_-S1L§ = param7;
         this.§_-k1W§ = param8;
      }
      
      public function get id() : int
      {
         return this.§_-4A§;
      }
      
      public function get rewardId() : int
      {
         return this.§_-w1J§;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get price() : Number
      {
         return this.§_-yQ§;
      }
      
      public function get §_-t2j§() : int
      {
         return this.§_-wy§;
      }
      
      public function get §_-330§() : String
      {
         return this.§_-m1o§;
      }
      
      public function get image() : DisplayObject
      {
         var _loc1_:Class = getDefinitionByName(this.§_-S1L§) as Class;
         return new _loc1_();
      }
      
      public function get §_-T2F§() : Vector.<§_-51T§>
      {
         return this.§_-k1W§;
      }
   }
}


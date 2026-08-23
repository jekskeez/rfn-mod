package tape
{
   import §_-S1n§.§_-kr§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import utils.§_-K1Y§;
   
   public class §_-m14§ extends §_-QN§
   {
      
      private static const §_-R2t§:int = 15;
      
      private var §_-n2x§:int = -1;
      
      private var _type:int = 0;
      
      private var count:int = 0;
      
      private var modes:uint = 0;
      
      private var button:SimpleButton;
      
      public function §_-m14§(param1:int, param2:int, param3:int, param4:uint, param5:SimpleButton)
      {
         super();
         this.id = param1;
         this.type = param2;
         this.count = param3;
         this.modes = param4;
         this.button = param5;
         this.init();
      }
      
      public function set id(param1:int) : void
      {
         this.§_-n2x§ = param1;
      }
      
      public function get id() : int
      {
         return this.§_-n2x§;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      private function init() : void
      {
         var _loc13_:int = 0;
         var _loc14_:uint = 0;
         addChild(this.button);
         var _loc1_:Location = §_-at§.§_-13l§(this._type);
         var _loc2_:Sprite = new Sprite();
         _loc2_.mouseEnabled = false;
         _loc2_.graphics.beginFill(16777215,0.9);
         _loc2_.graphics.drawRoundRect(48,57,33,13,5,5);
         addChild(_loc2_);
         var _loc3_:TextFormat = new TextFormat(§_-i5§.§_-c10§,11,6697728,true);
         var _loc4_:§_-i5§ = new §_-i5§(this.count + "/" + §_-R2t§,50,55,_loc3_);
         _loc4_.width = 29;
         _loc4_.autoSize = TextFieldAutoSize.CENTER;
         _loc4_.mouseEnabled = false;
         addChild(_loc4_);
         var _loc5_:TextFormat = new TextFormat(§_-i5§.§_-c10§,10,16777215,true);
         _loc5_.align = TextFormatAlign.CENTER;
         _loc5_.leading = -3;
         var _loc6_:Array = [new GlowFilter(6763521,1,7,7,3,2)];
         var _loc7_:§_-i5§ = new §_-i5§(§_-at§.§_-13l§(this._type).name,43,2,_loc5_);
         var _loc8_:Boolean = _loc7_.text.indexOf(" ") != -1;
         _loc7_.text = _loc7_.text.replace(" ","\n");
         _loc7_.mouseEnabled = false;
         _loc7_.filters = _loc6_;
         _loc7_.x -= _loc7_.width * 0.5;
         addChild(_loc7_);
         var _loc9_:TextFormat = new TextFormat(§_-i5§.§_-c10§,10,16777215);
         var _loc10_:§_-i5§ = new §_-i5§("№" + this.§_-n2x§,43,20,_loc9_);
         _loc10_.mouseEnabled = false;
         _loc10_.filters = _loc6_;
         _loc10_.x -= _loc10_.width * 0.5;
         _loc10_.y = _loc7_.y + (_loc8_ ? _loc7_.textHeight : _loc7_.height);
         addChild(_loc10_);
         var _loc11_:§_-i5§ = new §_-i5§("-" + _loc1_.cost,0,56,_loc9_,40);
         _loc11_.mouseEnabled = false;
         _loc11_.filters = _loc6_;
         addChild(_loc11_);
         §_-K1Y§.§_-P2W§(_loc11_,"-",ImageIconEnergy,0.5,0.5,-3,-56,false,true);
         if(!§_-at§.§_-13l§(this._type).§_-nY§ || this.modes == 0)
         {
            return;
         }
         var _loc12_:String = gls("Режимы:");
         for each(_loc13_ in §_-at§.§_-13l§(this._type).modes)
         {
            _loc14_ = uint(1 << _loc13_);
            if((this.modes & _loc14_) != 0)
            {
               _loc12_ += "\n" + §_-at§.§_-02X§[_loc13_]["name"];
            }
         }
         new §_-kr§(this,_loc12_);
      }
   }
}


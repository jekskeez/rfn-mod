package tape
{
   import §_-e1G§.§_-Hb§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import utils.§_-jB§;
   
   public class §_-Ya§ extends §_-K2k§
   {
      
      private static const §_-435§:int = 15;
      
      private var §_-4A§:int = -1;
      
      private var _type:int = 0;
      
      private var count:int = 0;
      
      private var modes:uint = 0;
      
      private var button:SimpleButton;
      
      public function §_-Ya§(param1:int, param2:int, param3:int, param4:uint, param5:SimpleButton)
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
         this.§_-4A§ = param1;
      }
      
      public function get id() : int
      {
         return this.§_-4A§;
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
         var _loc1_:Location = §_-q1p§.§_-l29§(this._type);
         var _loc2_:Sprite = new Sprite();
         _loc2_.mouseEnabled = false;
         _loc2_.graphics.beginFill(16777215,0.9);
         _loc2_.graphics.drawRoundRect(48,57,33,13,5,5);
         addChild(_loc2_);
         var _loc3_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,11,6697728,true);
         var _loc4_:§_-22V§ = new §_-22V§(this.count + "/" + §_-435§,50,55,_loc3_);
         _loc4_.width = 29;
         _loc4_.autoSize = TextFieldAutoSize.CENTER;
         _loc4_.mouseEnabled = false;
         addChild(_loc4_);
         var _loc5_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,10,16777215,true);
         _loc5_.align = TextFormatAlign.CENTER;
         _loc5_.leading = -3;
         var _loc6_:Array = [new GlowFilter(6763521,1,7,7,3,2)];
         var _loc7_:§_-22V§ = new §_-22V§(§_-q1p§.§_-l29§(this._type).name,43,2,_loc5_);
         var _loc8_:Boolean = _loc7_.text.indexOf(" ") != -1;
         _loc7_.text = _loc7_.text.replace(" ","\n");
         _loc7_.mouseEnabled = false;
         _loc7_.filters = _loc6_;
         _loc7_.x -= _loc7_.width * 0.5;
         addChild(_loc7_);
         var _loc9_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,10,16777215);
         var _loc10_:§_-22V§ = new §_-22V§("№" + this.§_-4A§,43,20,_loc9_);
         _loc10_.mouseEnabled = false;
         _loc10_.filters = _loc6_;
         _loc10_.x -= _loc10_.width * 0.5;
         _loc10_.y = _loc7_.y + (_loc8_ ? _loc7_.textHeight : _loc7_.height);
         addChild(_loc10_);
         var _loc11_:§_-22V§ = new §_-22V§("-" + _loc1_.cost,0,56,_loc9_,40);
         _loc11_.mouseEnabled = false;
         _loc11_.filters = _loc6_;
         addChild(_loc11_);
         §_-jB§.§_-fG§(_loc11_,"-",ImageIconEnergy,0.5,0.5,-3,-56,false,true);
         if(!§_-q1p§.§_-l29§(this._type).§_-L1j§ || this.modes == 0)
         {
            return;
         }
         var _loc12_:String = gls("Режимы:");
         for each(_loc13_ in §_-q1p§.§_-l29§(this._type).modes)
         {
            _loc14_ = uint(1 << _loc13_);
            if((this.modes & _loc14_) != 0)
            {
               _loc12_ += "\n" + §_-q1p§.§_-m15§[_loc13_]["name"];
            }
         }
         new §_-Hb§(this,_loc12_);
      }
   }
}


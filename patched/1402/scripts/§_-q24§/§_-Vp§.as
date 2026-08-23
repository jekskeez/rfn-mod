package §_-q24§
{
   import §_-22D§.TweenMax;
   import §_-K1§.§_-s2v§;
   import §_-X1k§.§_-93H§;
   import §_-X1k§.§_-ku§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.DropShadowFilter;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-K1Y§;
   import utils.§_-k12§;
   import utils.§_-p1r§;
   
   public class §_-Vp§ extends §_-F2c§
   {
      
      public static const §_-pQ§:Array = [{
         "class":EnergyGlassBigClip,
         "offsetX":23,
         "offsetY":22,
         "scale":1.2,
         "font":"green",
         "countAnim":1,
         "showIcon":true,
         "goodId":§_-u1O§.§_-A27§,
         "color":[0,0,0,0],
         "text":"250 -",
         "image":ImageIconEnergy
      },{
         "class":ManaGlassBigClip,
         "offsetX":23,
         "offsetY":22,
         "scale":1.2,
         "font":"blue",
         "countAnim":1,
         "showIcon":true,
         "goodId":§_-u1O§.§_-gh§,
         "color":[0,0,0,180],
         "text":"400 -",
         "image":ImageIconMana
      },{
         "class":ManaRegenerationClip,
         "offsetX":34,
         "offsetY":23,
         "scale":1.2,
         "font":"blue",
         "countAnim":3,
         "showIcon":false,
         "goodId":§_-u1O§.§_-Y2s§,
         "color":[-20,0,0,-108],
         "text":"25 -/" + gls("мин"),
         "image":ImageIconMana
      }];
      
      private static const §_-O1R§:Point = new Point(109,200);
      
      private static const §_-C1Q§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,8674113,true);
      
      private static const TEXT:TextFormat = new TextFormat(§_-i5§.§_-p1s§,20,16777215);
      
      private static const §_-B8§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,13,16777215);
      
      private var §_-Ut§:§_-s2v§ = null;
      
      private var §_-11P§:MovieClip = null;
      
      private var §_-fJ§:Sprite = null;
      
      public function §_-Vp§(param1:int)
      {
         super(param1);
         if(this.id == §_-sL§.§_-v1J§)
         {
            this.§_-Ut§ = new §_-s2v§();
            this.§_-Ut§.x = 20;
            this.§_-Ut§.y = 225;
            this.§_-Ut§.text = gls("Активно");
            this.§_-Ut§.visible = false;
            addChild(this.§_-Ut§);
            §_-ku§.addEventListener(GameEvent.ON_CHANGE,this.§_-w1T§);
         }
         Connection.listen(this.§_-43l§,[§_-s2l§.BUY]);
      }
      
      override protected function get titleFormat() : TextFormat
      {
         return new TextFormat(§_-i5§.§_-p1s§,16,6697728,false,null,null,null,null,"center");
      }
      
      override protected function §_-5N§() : void
      {
         super.§_-5N§();
         this.§_-Q1w§.y = 5;
         this.§_-fJ§ = new Sprite();
         this.image = new this.imageClass();
         this.image.scaleX = this.image.scaleY = §_-pQ§[this.id]["scale"];
         this.image.x = int((this.backWidth - this.image.width) * 0.5) + §_-pQ§[this.id]["offsetX"];
         this.image.y = int((this.backHeight - this.image.height) * 0.5) + §_-pQ§[this.id]["offsetY"];
         (this.image as MovieClip).stop();
         §_-k12§.stopAll(this.image as MovieClip,1);
         addChild(this.image);
         addButton(this.cost,ImageIconCoins,this.buy);
         if(this.extraCost > 0)
         {
            addButton(this.extraCost,ImageIconCoins,this.§_-C§);
         }
         addChild(this.§_-fJ§);
         this.§_-11P§ = this.§_-g19§(§_-pQ§[this.id]["color"],§_-pQ§[this.id]["text"],§_-pQ§[this.id]["image"]);
         addChild(this.§_-11P§);
         if(this.extraCost == 0)
         {
            return;
         }
         var _loc1_:§_-i5§ = new §_-i5§(gls("На день"),10,245,§_-C1Q§);
         _loc1_.x = 55 - int(_loc1_.textWidth * 0.5);
         addChild(_loc1_);
         _loc1_ = new §_-i5§(gls("На неделю"),120,245,§_-C1Q§);
         _loc1_.x = 145 - int(_loc1_.textWidth * 0.5);
         addChild(_loc1_);
      }
      
      override protected function get title() : String
      {
         return §_-sL§.§_-3f§(id);
      }
      
      override protected function get imageClass() : Class
      {
         return §_-pQ§[this.id]["class"];
      }
      
      override protected function get cost() : int
      {
         switch(this.id)
         {
            case 0:
               return §_-93H§.§_-p2p§();
            case 1:
               return §_-93H§.§_-te§();
            case 2:
               return §_-93H§.§_-63a§(0);
            default:
               return 0;
         }
      }
      
      override protected function get extraCost() : int
      {
         if(this.id == 2)
         {
            return §_-93H§.§_-63a§(1);
         }
         return 0;
      }
      
      protected function buy(param1:MouseEvent) : void
      {
         Game.§_-u2z§(§_-sL§.§_-iM§(this.id),this.cost,0,Game.selfId);
      }
      
      protected function §_-C§(param1:MouseEvent) : void
      {
         Game.§_-u2z§(§_-sL§.§_-iM§(this.id),this.extraCost,0,Game.selfId,1);
      }
      
      protected function §_-82L§() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         var _loc2_:Sprite = new Sprite();
         var _loc3_:TextFormat = new TextFormat(§_-i5§.§_-c10§,20,§_-pQ§[this.id]["font"] == "green" ? 3722240 : 2472447,true);
         var _loc4_:String = §_-pQ§[this.id]["text"].split("-")[0];
         var _loc5_:§_-i5§ = new §_-i5§(_loc4_ + (§_-pQ§[this.id]["showIcon"] == true ? " -" : ""),0,0,_loc3_);
         _loc5_.filters = [new DropShadowFilter(0,0,4072964,1,4,4,10,1)];
         _loc2_.addChild(_loc5_);
         if(§_-pQ§[this.id]["showIcon"] == true)
         {
            §_-K1Y§.§_-P2W§(_loc5_,"-",§_-pQ§[this.id]["image"],1,1,1,1,false,true)[0];
         }
         _loc2_.x = -_loc2_.width * 0.5;
         _loc2_.y = -_loc2_.height * 0.5;
         _loc1_.addChild(_loc2_);
         this.§_-fJ§.addChild(_loc1_);
         return _loc1_;
      }
      
      private function §_-E2r§(param1:Event = null) : void
      {
         var _loc9_:Sprite = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc2_:MovieClip = this.image as MovieClip;
         §_-k12§.§_-b2P§(_loc2_,1,this.§_-Pv§);
         var _loc3_:int = 20;
         var _loc4_:Number = 0.4;
         var _loc5_:Number = _loc4_ * (§_-pQ§[this.id]["countAnim"] - 1) * 0.5;
         var _loc6_:Point = new Point(110,200);
         var _loc7_:Number = 160;
         var _loc8_:int = 0;
         while(_loc8_ < §_-pQ§[this.id]["countAnim"])
         {
            _loc9_ = this.§_-82L§();
            _loc9_.x = _loc6_.x;
            _loc9_.y = _loc6_.y;
            _loc10_ = -1.57 + _loc8_ * _loc4_ - _loc5_;
            _loc11_ = Math.cos(_loc10_) * _loc7_ + _loc6_.x;
            _loc12_ = Math.sin(_loc10_) * _loc7_ + _loc6_.y;
            TweenMax.to(_loc9_,13 / _loc3_,{
               "x":_loc11_,
               "y":_loc12_
            });
            TweenMax.to(_loc9_,4 / _loc3_,{
               "delay":9 / _loc3_,
               "alpha":0
            });
            _loc8_++;
         }
         this.§_-11P§.scaleX = this.§_-11P§.scaleY = 1;
         this.§_-11P§.alpha = 1;
         TweenMax.to(this.§_-11P§,8 / _loc3_,{
            "scaleX":0,
            "scaleY":0,
            "alpha":0
         });
      }
      
      private function §_-Pv§() : void
      {
         (this.image as MovieClip).gotoAndStop(1);
         this.§_-fJ§.removeChildren();
         this.§_-11P§.scaleX = this.§_-11P§.scaleY = this.§_-11P§.alpha = 1;
      }
      
      private function §_-g19§(param1:Array, param2:String, param3:Class) : MovieClip
      {
         var _loc11_:§_-i5§ = null;
         var _loc4_:MovieClip = new MovieClip();
         _loc4_.x = §_-O1R§.x;
         _loc4_.y = §_-O1R§.y;
         var _loc5_:RibbonImage = new RibbonImage();
         _loc4_.addChild(_loc5_);
         var _loc6_:Sprite = new Sprite();
         _loc4_.addChild(_loc6_);
         var _loc7_:§_-i5§ = new §_-i5§(param2.split("-")[0] + "-",0,-2,TEXT);
         _loc6_.addChild(_loc7_);
         var _loc8_:Number = 22 * param2.length;
         _loc5_.width = _loc8_ > _loc5_.width ? _loc8_ : Number(_loc5_.width);
         var _loc9_:§_-p1r§ = new §_-p1r§();
         _loc9_.§_-xC§(param1[0],param1[1],param1[2],param1[3]);
         _loc5_.filters = [new ColorMatrixFilter(_loc9_)];
         if(param2.split("-").length > 1)
         {
            _loc11_ = new §_-i5§(param2.split("-")[1],0,0,§_-B8§);
            _loc6_.addChild(_loc11_);
         }
         var _loc10_:DisplayObject = §_-K1Y§.§_-P2W§(_loc7_,"-",param3,1,1,1,1,false,true)[0];
         _loc11_.x = _loc10_.x + _loc10_.width;
         _loc11_.y = (_loc10_.y + _loc10_.height - _loc11_.height) * 0.5;
         _loc6_.x = -_loc6_.width * 0.5;
         _loc6_.y = -_loc6_.height * 0.5 + 8;
         return _loc4_;
      }
      
      private function §_-w1T§(param1:GameEvent) : void
      {
         this.§_-Ut§.visible = §_-ku§.§_-R1C§(§_-ku§.§_-v2p§);
         this.§_-Ut§.value = §_-ku§.§_-g2V§(§_-ku§.§_-v2p§);
      }
      
      private function §_-43l§(param1:§_-s2l§) : void
      {
         if(param1[2] == §_-pQ§[this.id]["goodId"])
         {
            this.§_-E2r§();
         }
      }
   }
}


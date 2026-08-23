package §_-A2j§
{
   import §_-42B§.TweenMax;
   import §_-62p§.§_-h1U§;
   import §_-I10§.§_-8S§;
   import §_-I10§.§_-e1z§;
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
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-63K§;
   import utils.§_-jB§;
   import utils.§_-nO§;
   
   public class §_-NX§ extends §_-q2§
   {
      
      public static const §_-SI§:Array = [{
         "class":EnergyGlassBigClip,
         "offsetX":23,
         "offsetY":22,
         "scale":1.2,
         "font":"green",
         "countAnim":1,
         "showIcon":true,
         "goodId":§_-h2B§.§_-138§,
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
         "goodId":§_-h2B§.§_-W2d§,
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
         "goodId":§_-h2B§.§_-NV§,
         "color":[-20,0,0,-108],
         "text":"25 -/" + gls("мин"),
         "image":ImageIconMana
      }];
      
      private static const §_-r2B§:Point = new Point(109,200);
      
      private static const §_-CD§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,8674113,true);
      
      private static const TEXT:TextFormat = new TextFormat(§_-22V§.§_-pJ§,20,16777215);
      
      private static const §_-912§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,13,16777215);
      
      private var §_-sM§:§_-h1U§ = null;
      
      private var §_-O10§:MovieClip = null;
      
      private var §_-w1E§:Sprite = null;
      
      public function §_-NX§(param1:int)
      {
         super(param1);
         if(this.id == §_-y1§.§_-8J§)
         {
            this.§_-sM§ = new §_-h1U§();
            this.§_-sM§.x = 20;
            this.§_-sM§.y = 225;
            this.§_-sM§.text = gls("Активно");
            this.§_-sM§.visible = false;
            addChild(this.§_-sM§);
            §_-e1z§.addEventListener(GameEvent.ON_CHANGE,this.§_-Hp§);
         }
         Connection.listen(this.§_-c2n§,[§_-S2I§.BUY]);
      }
      
      override protected function get titleFormat() : TextFormat
      {
         return new TextFormat(§_-22V§.§_-pJ§,16,6697728,false,null,null,null,null,"center");
      }
      
      override protected function §_-Cr§() : void
      {
         super.§_-Cr§();
         this.§_-T1j§.y = 5;
         this.§_-w1E§ = new Sprite();
         this.image = new this.imageClass();
         this.image.scaleX = this.image.scaleY = §_-SI§[this.id]["scale"];
         this.image.x = int((this.backWidth - this.image.width) * 0.5) + §_-SI§[this.id]["offsetX"];
         this.image.y = int((this.backHeight - this.image.height) * 0.5) + §_-SI§[this.id]["offsetY"];
         (this.image as MovieClip).stop();
         §_-63K§.stopAll(this.image as MovieClip,1);
         addChild(this.image);
         addButton(this.cost,ImageIconCoins,this.buy);
         if(this.extraCost > 0)
         {
            addButton(this.extraCost,ImageIconCoins,this.§_-s2P§);
         }
         addChild(this.§_-w1E§);
         this.§_-O10§ = this.§_-x1a§(§_-SI§[this.id]["color"],§_-SI§[this.id]["text"],§_-SI§[this.id]["image"]);
         addChild(this.§_-O10§);
         if(this.extraCost == 0)
         {
            return;
         }
         var _loc1_:§_-22V§ = new §_-22V§(gls("На день"),10,245,§_-CD§);
         _loc1_.x = 55 - int(_loc1_.textWidth * 0.5);
         addChild(_loc1_);
         _loc1_ = new §_-22V§(gls("На неделю"),120,245,§_-CD§);
         _loc1_.x = 145 - int(_loc1_.textWidth * 0.5);
         addChild(_loc1_);
      }
      
      override protected function get title() : String
      {
         return §_-y1§.§_-bh§(id);
      }
      
      override protected function get imageClass() : Class
      {
         return §_-SI§[this.id]["class"];
      }
      
      override protected function get cost() : int
      {
         switch(this.id)
         {
            case 0:
               return §_-8S§.§_-1E§();
            case 1:
               return §_-8S§.§_-TA§();
            case 2:
               return §_-8S§.§_-Ln§(0);
            default:
               return 0;
         }
      }
      
      override protected function get extraCost() : int
      {
         if(this.id == 2)
         {
            return §_-8S§.§_-Ln§(1);
         }
         return 0;
      }
      
      protected function buy(param1:MouseEvent) : void
      {
         Game.§_-K2t§(§_-y1§.§_-eC§(this.id),this.cost,0,Game.selfId);
      }
      
      protected function §_-s2P§(param1:MouseEvent) : void
      {
         Game.§_-K2t§(§_-y1§.§_-eC§(this.id),this.extraCost,0,Game.selfId,1);
      }
      
      protected function §_-z1k§() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         var _loc2_:Sprite = new Sprite();
         var _loc3_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,20,§_-SI§[this.id]["font"] == "green" ? 3722240 : 2472447,true);
         var _loc4_:String = §_-SI§[this.id]["text"].split("-")[0];
         var _loc5_:§_-22V§ = new §_-22V§(_loc4_ + (§_-SI§[this.id]["showIcon"] == true ? " -" : ""),0,0,_loc3_);
         _loc5_.filters = [new DropShadowFilter(0,0,4072964,1,4,4,10,1)];
         _loc2_.addChild(_loc5_);
         if(§_-SI§[this.id]["showIcon"] == true)
         {
            §_-jB§.§_-fG§(_loc5_,"-",§_-SI§[this.id]["image"],1,1,1,1,false,true)[0];
         }
         _loc2_.x = -_loc2_.width * 0.5;
         _loc2_.y = -_loc2_.height * 0.5;
         _loc1_.addChild(_loc2_);
         this.§_-w1E§.addChild(_loc1_);
         return _loc1_;
      }
      
      private function §_-51t§(param1:Event = null) : void
      {
         var _loc9_:Sprite = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc2_:MovieClip = this.image as MovieClip;
         §_-63K§.§_-e2l§(_loc2_,1,this.§_-73e§);
         var _loc3_:int = 20;
         var _loc4_:Number = 0.4;
         var _loc5_:Number = _loc4_ * (§_-SI§[this.id]["countAnim"] - 1) * 0.5;
         var _loc6_:Point = new Point(110,200);
         var _loc7_:Number = 160;
         var _loc8_:int = 0;
         while(_loc8_ < §_-SI§[this.id]["countAnim"])
         {
            _loc9_ = this.§_-z1k§();
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
         this.§_-O10§.scaleX = this.§_-O10§.scaleY = 1;
         this.§_-O10§.alpha = 1;
         TweenMax.to(this.§_-O10§,8 / _loc3_,{
            "scaleX":0,
            "scaleY":0,
            "alpha":0
         });
      }
      
      private function §_-73e§() : void
      {
         (this.image as MovieClip).gotoAndStop(1);
         this.§_-w1E§.removeChildren();
         this.§_-O10§.scaleX = this.§_-O10§.scaleY = this.§_-O10§.alpha = 1;
      }
      
      private function §_-x1a§(param1:Array, param2:String, param3:Class) : MovieClip
      {
         var _loc11_:§_-22V§ = null;
         var _loc4_:MovieClip = new MovieClip();
         _loc4_.x = §_-r2B§.x;
         _loc4_.y = §_-r2B§.y;
         var _loc5_:RibbonImage = new RibbonImage();
         _loc4_.addChild(_loc5_);
         var _loc6_:Sprite = new Sprite();
         _loc4_.addChild(_loc6_);
         var _loc7_:§_-22V§ = new §_-22V§(param2.split("-")[0] + "-",0,-2,TEXT);
         _loc6_.addChild(_loc7_);
         var _loc8_:Number = 22 * param2.length;
         _loc5_.width = _loc8_ > _loc5_.width ? _loc8_ : Number(_loc5_.width);
         var _loc9_:§_-nO§ = new §_-nO§();
         _loc9_.§_-bb§(param1[0],param1[1],param1[2],param1[3]);
         _loc5_.filters = [new ColorMatrixFilter(_loc9_)];
         if(param2.split("-").length > 1)
         {
            _loc11_ = new §_-22V§(param2.split("-")[1],0,0,§_-912§);
            _loc6_.addChild(_loc11_);
         }
         var _loc10_:DisplayObject = §_-jB§.§_-fG§(_loc7_,"-",param3,1,1,1,1,false,true)[0];
         _loc11_.x = _loc10_.x + _loc10_.width;
         _loc11_.y = (_loc10_.y + _loc10_.height - _loc11_.height) * 0.5;
         _loc6_.x = -_loc6_.width * 0.5;
         _loc6_.y = -_loc6_.height * 0.5 + 8;
         return _loc4_;
      }
      
      private function §_-Hp§(param1:GameEvent) : void
      {
         this.§_-sM§.visible = §_-e1z§.§_-Lq§(§_-e1z§.§_-02l§);
         this.§_-sM§.value = §_-e1z§.§_-7v§(§_-e1z§.§_-02l§);
      }
      
      private function §_-c2n§(param1:§_-S2I§) : void
      {
         if(param1[2] == §_-SI§[this.id]["goodId"])
         {
            this.§_-51t§();
         }
      }
   }
}


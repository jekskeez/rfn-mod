package §_-q24§
{
   import §_-X1k§.§_-93H§;
   import §_-X1k§.§_-EJ§;
   import buttons.§_-K2G§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import protocol.§_-u1O§;
   import tape.§_-2n§;
   import tape.§_-S1M§;
   import tape.§_-h2f§;
   import utils.§_-K1Y§;
   import views.§_-xl§;
   
   public class §_-u2X§ extends §_-S1M§
   {
      
      public static const §_-zx§:Array = [new GlowFilter(3407616,1,2,2,8)];
      
      private static var _instance:§_-u2X§ = null;
      
      public var §_-N2m§:§_-i5§ = null;
      
      public var §_-73F§:§_-i5§ = null;
      
      private var buttonBuy:§_-K2G§ = null;
      
      private var §_-N1C§:int = 0;
      
      private var §_-z21§:Sprite = null;
      
      private var §_-43g§:MovieClip = null;
      
      private var §_-b1Y§:DisplayObject = null;
      
      public function §_-u2X§()
      {
         super(4,3,22.5,65,15,15,110,115,true,true,false);
         _instance = this;
      }
      
      public static function update() : void
      {
         if(_instance)
         {
            _instance.§_-11q§(_instance.§_-02G§);
         }
      }
      
      override public function setData(param1:§_-h2f§) : void
      {
         super.setData(param1);
         if(param1.objects.length != 0)
         {
            select(param1.objects[0] as §_-2n§);
         }
         else
         {
            select(null);
         }
      }
      
      override protected function init() : void
      {
         super.init();
         addChildAt(new ImageShopSmilesBack(),0);
         this.buttonBuy = new §_-K2G§("");
         this.buttonBuy.x = 663;
         this.buttonBuy.y = 438;
         this.buttonBuy.addEventListener(MouseEvent.CLICK,this.buy);
         addChild(this.buttonBuy);
         this.§_-N2m§ = new §_-i5§("",560,49,new TextFormat(§_-i5§.§_-p1s§,20,6697728,false,null,null,null,null,"center"),292);
         addChild(this.§_-N2m§);
         this.§_-73F§ = new §_-i5§("",560,293,new TextFormat(§_-i5§.§_-c10§,12,6829595,false),292);
         addChild(this.§_-73F§);
         this.§_-z21§ = new Sprite();
         this.§_-z21§.x = 560;
         this.§_-z21§.y = 335;
         addChild(this.§_-z21§);
         §_-EJ§.addEventListener(GameEvent.SMILES_CHANGED,this.§_-w1T§);
      }
      
      protected function get coins() : int
      {
         return §_-93H§.§_-21I§(this.§_-N1C§);
      }
      
      override protected function §_-11q§(param1:§_-2n§) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Sprite = null;
         var _loc6_:ElementPackageBack = null;
         var _loc7_:MovieClip = null;
         if(param1 == null)
         {
            return;
         }
         this.§_-N1C§ = param1.id;
         this.buttonBuy.field.text = this.coins.toString() + " - ";
         this.buttonBuy.clear();
         this.buttonBuy.redraw();
         §_-K1Y§.§_-P2W§(this.buttonBuy.field,"-",ImageIconCoins,0.7,0.7,-this.buttonBuy.field.x,-3,false,true);
         this.buttonBuy.visible = !§_-xl§.§_-83p§(param1.id);
         this.§_-N2m§.text = §_-EJ§.§_-aO§[param1.id].name;
         this.§_-73F§.text = §_-EJ§.§_-aO§[param1.id].description;
         while(this.§_-z21§.numChildren > 0)
         {
            this.§_-z21§.removeChildAt(0);
         }
         var _loc2_:Array = §_-93H§.§_-23K§(param1.id);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = int(_loc2_[_loc3_]);
            _loc5_ = new Sprite();
            _loc5_.buttonMode = true;
            _loc5_.x = _loc3_ % 7 * 42;
            _loc5_.y = int(_loc3_ / 7) * 44;
            _loc5_.name = _loc4_.toString();
            _loc5_.addEventListener(MouseEvent.CLICK,this.§_-h1u§);
            _loc6_ = new ElementPackageBack();
            _loc6_.width = 40;
            _loc6_.height = 42;
            _loc5_.addChild(_loc6_);
            if("image" in §_-xl§.§_-z2k§[_loc4_])
            {
               _loc7_ = new §_-xl§.§_-z2k§[_loc4_]["image"]();
               _loc7_.stop();
            }
            else
            {
               _loc7_ = new §_-xl§.§_-z2k§[_loc4_]["btn"]();
               _loc7_.gotoAndStop(§_-xl§.§_-z2k§[_loc4_]["frame"]);
            }
            _loc7_.width = 40;
            _loc7_.height = 42;
            _loc7_.scaleX = _loc7_.scaleY = Math.min(_loc7_.scaleX,_loc7_.scaleY);
            _loc7_.x = 20;
            _loc7_.y = 21;
            _loc5_.addChild(_loc7_);
            this.§_-z21§.addChild(_loc5_);
            _loc3_++;
         }
         if(this.§_-b1Y§)
         {
            this.§_-b1Y§.filters = [];
         }
         this.§_-b1Y§ = this.§_-z21§.getChildAt(0);
         this.§_-b1Y§.filters = §_-zx§;
         this.§_-g20§(_loc2_[0]);
      }
      
      private function §_-w1T§(param1:GameEvent) : void
      {
         this.buttonBuy.visible = !§_-xl§.§_-83p§(this.§_-N1C§);
      }
      
      private function buy(param1:Event) : void
      {
         Game.§_-u2z§(§_-u1O§.§_-RL§,this.coins,0,Game.selfId,this.§_-N1C§);
      }
      
      private function §_-h1u§(param1:MouseEvent) : void
      {
         if(this.§_-b1Y§)
         {
            this.§_-b1Y§.filters = [];
         }
         this.§_-b1Y§ = param1.currentTarget as DisplayObject;
         this.§_-b1Y§.filters = §_-zx§;
         this.§_-g20§(int(param1.currentTarget.name));
      }
      
      private function §_-g20§(param1:int) : void
      {
         if(this.§_-43g§)
         {
            removeChild(this.§_-43g§);
         }
         this.§_-43g§ = new §_-xl§.§_-z2k§[param1]["btn"]();
         this.§_-43g§.scaleX = this.§_-43g§.scaleY = 3;
         this.§_-43g§.x = 705;
         this.§_-43g§.y = 190;
         addChild(this.§_-43g§);
      }
   }
}


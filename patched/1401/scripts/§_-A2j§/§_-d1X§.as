package §_-A2j§
{
   import §_-I10§.§_-01k§;
   import §_-I10§.§_-8S§;
   import buttons.§_-j18§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import protocol.§_-h2B§;
   import tape.§_-A3s§;
   import tape.§_-wP§;
   import tape.§_-xc§;
   import utils.§_-jB§;
   import views.§_-l1b§;
   
   public class §_-d1X§ extends §_-wP§
   {
      
      public static const §_-d2o§:Array = [new GlowFilter(3407616,1,2,2,8)];
      
      private static var _instance:§_-d1X§ = null;
      
      public var §_-Uk§:§_-22V§ = null;
      
      public var §_-P1z§:§_-22V§ = null;
      
      private var buttonBuy:§_-j18§ = null;
      
      private var §_-w2L§:int = 0;
      
      private var §_-13K§:Sprite = null;
      
      private var §_-Qu§:MovieClip = null;
      
      private var §_-Ss§:DisplayObject = null;
      
      public function §_-d1X§()
      {
         super(4,3,22.5,65,15,15,110,115,true,true,false);
         _instance = this;
      }
      
      public static function update() : void
      {
         if(_instance)
         {
            _instance.§_-x2k§(_instance.§_-Y1y§);
         }
      }
      
      override public function setData(param1:§_-xc§) : void
      {
         super.setData(param1);
         if(param1.objects.length != 0)
         {
            select(param1.objects[0] as §_-A3s§);
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
         this.buttonBuy = new §_-j18§("");
         this.buttonBuy.x = 663;
         this.buttonBuy.y = 438;
         this.buttonBuy.addEventListener(MouseEvent.CLICK,this.buy);
         addChild(this.buttonBuy);
         this.§_-Uk§ = new §_-22V§("",560,49,new TextFormat(§_-22V§.§_-pJ§,20,6697728,false,null,null,null,null,"center"),292);
         addChild(this.§_-Uk§);
         this.§_-P1z§ = new §_-22V§("",560,293,new TextFormat(§_-22V§.§_-F2z§,12,6829595,false),292);
         addChild(this.§_-P1z§);
         this.§_-13K§ = new Sprite();
         this.§_-13K§.x = 560;
         this.§_-13K§.y = 335;
         addChild(this.§_-13K§);
         §_-01k§.addEventListener(GameEvent.SMILES_CHANGED,this.§_-Hp§);
      }
      
      protected function get coins() : int
      {
         return §_-8S§.§_-q2J§(this.§_-w2L§);
      }
      
      override protected function §_-x2k§(param1:§_-A3s§) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Sprite = null;
         var _loc6_:ElementPackageBack = null;
         var _loc7_:MovieClip = null;
         if(param1 == null)
         {
            return;
         }
         this.§_-w2L§ = param1.id;
         this.buttonBuy.field.text = this.coins.toString() + " - ";
         this.buttonBuy.clear();
         this.buttonBuy.redraw();
         §_-jB§.§_-fG§(this.buttonBuy.field,"-",ImageIconCoins,0.7,0.7,-this.buttonBuy.field.x,-3,false,true);
         this.buttonBuy.visible = !§_-l1b§.§_-pq§(param1.id);
         this.§_-Uk§.text = §_-01k§.§_-p2R§[param1.id].name;
         this.§_-P1z§.text = §_-01k§.§_-p2R§[param1.id].description;
         while(this.§_-13K§.numChildren > 0)
         {
            this.§_-13K§.removeChildAt(0);
         }
         var _loc2_:Array = §_-8S§.§_-ic§(param1.id);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = int(_loc2_[_loc3_]);
            _loc5_ = new Sprite();
            _loc5_.buttonMode = true;
            _loc5_.x = _loc3_ % 7 * 42;
            _loc5_.y = int(_loc3_ / 7) * 44;
            _loc5_.name = _loc4_.toString();
            _loc5_.addEventListener(MouseEvent.CLICK,this.§_-91N§);
            _loc6_ = new ElementPackageBack();
            _loc6_.width = 40;
            _loc6_.height = 42;
            _loc5_.addChild(_loc6_);
            if("image" in §_-l1b§.§_-02E§[_loc4_])
            {
               _loc7_ = new §_-l1b§.§_-02E§[_loc4_]["image"]();
               _loc7_.stop();
            }
            else
            {
               _loc7_ = new §_-l1b§.§_-02E§[_loc4_]["btn"]();
               _loc7_.gotoAndStop(§_-l1b§.§_-02E§[_loc4_]["frame"]);
            }
            _loc7_.width = 40;
            _loc7_.height = 42;
            _loc7_.scaleX = _loc7_.scaleY = Math.min(_loc7_.scaleX,_loc7_.scaleY);
            _loc7_.x = 20;
            _loc7_.y = 21;
            _loc5_.addChild(_loc7_);
            this.§_-13K§.addChild(_loc5_);
            _loc3_++;
         }
         if(this.§_-Ss§)
         {
            this.§_-Ss§.filters = [];
         }
         this.§_-Ss§ = this.§_-13K§.getChildAt(0);
         this.§_-Ss§.filters = §_-d2o§;
         this.§_-z1a§(_loc2_[0]);
      }
      
      private function §_-Hp§(param1:GameEvent) : void
      {
         this.buttonBuy.visible = !§_-l1b§.§_-pq§(this.§_-w2L§);
      }
      
      private function buy(param1:Event) : void
      {
         Game.§_-K2t§(§_-h2B§.§_-6d§,this.coins,0,Game.selfId,this.§_-w2L§);
      }
      
      private function §_-91N§(param1:MouseEvent) : void
      {
         if(this.§_-Ss§)
         {
            this.§_-Ss§.filters = [];
         }
         this.§_-Ss§ = param1.currentTarget as DisplayObject;
         this.§_-Ss§.filters = §_-d2o§;
         this.§_-z1a§(int(param1.currentTarget.name));
      }
      
      private function §_-z1a§(param1:int) : void
      {
         if(this.§_-Qu§)
         {
            removeChild(this.§_-Qu§);
         }
         this.§_-Qu§ = new §_-l1b§.§_-02E§[param1]["btn"]();
         this.§_-Qu§.scaleX = this.§_-Qu§.scaleY = 3;
         this.§_-Qu§.x = 705;
         this.§_-Qu§.y = 190;
         addChild(this.§_-Qu§);
      }
   }
}


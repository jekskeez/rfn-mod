package §_-q24§
{
   import §_-J19§.§_-B26§;
   import §_-O2Y§.§_-jD§;
   import §_-Qy§.§_-RT§;
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-P2x§;
   import §_-X1k§.§_-y2L§;
   import buttons.§_-K2G§;
   import events.GameEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.§_-u1O§;
   import tape.§_-2n§;
   import utils.§_-K1Y§;
   import views.§_-918§;
   import views.§_-Y2D§;
   
   public class §_-o1A§ extends §_-2n§
   {
      
      private static const §_-C1Q§:TextFormat = new TextFormat(null,12,8674113,true);
      
      private var icon:§_-Y2D§;
      
      private var §_-n2i§:§_-i5§ = null;
      
      private var §_-B11§:§_-i5§ = null;
      
      private var §_-i26§:§_-K2G§ = null;
      
      private var buttonBuy:§_-K2G§ = null;
      
      private var §_-q1l§:§_-RT§ = null;
      
      private var §_-Ja§:§_-918§ = null;
      
      public function §_-o1A§(param1:int)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         var _loc2_:§_-jD§ = null;
         super.init();
         this.§_-Oh§ = new ElementPackageLargeBackSelected();
         this.§_-Oh§.visible = false;
         addChild(this.§_-Oh§);
         this.back = new ElementPackageLargeBack();
         addChild(this.back);
         var _loc1_:§_-i5§ = new §_-i5§(§_-P2x§.§_-01H§(this.id),30,5,new TextFormat(§_-i5§.§_-c10§,16,6697728,true,null,null,null,null,"center"),125);
         addChild(_loc1_);
         this.icon = new §_-Y2D§(this.id);
         this.icon.scaleX = this.icon.scaleY = 0.72;
         this.icon.x = int((this.back.width - this.icon.width) * 0.5);
         this.icon.y = int((this.back.height - this.icon.height) * 0.5);
         addChild(this.icon);
         if(§_-P2x§.§_-G1S§(this.id).length > 0)
         {
            _loc2_ = new §_-jD§(§_-P2x§.§_-G1S§(this.id)[0]);
            _loc2_.width = _loc2_.height = 30;
            _loc2_.x = 175;
            _loc2_.y = 20;
            addChild(_loc2_);
         }
         this.update();
         §_-L1o§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.update);
         §_-y2L§.addEventListener(GameEvent.CLOSEOUT_START,this.update);
         §_-y2L§.addEventListener(GameEvent.CLOSEOUT_END,this.update);
      }
      
      protected function update(param1:GameEvent = null) : void
      {
         if(!§_-L1o§.§_-T1N§(this.id))
         {
            if(!this.§_-i26§ || !this.buttonBuy)
            {
               this.§_-i26§ = new §_-K2G§("",80);
               this.§_-i26§.x = 7;
               this.§_-i26§.y = 202;
               this.§_-i26§.addEventListener(MouseEvent.CLICK,this.§_-p14§);
               addChild(this.§_-i26§);
               this.buttonBuy = new §_-K2G§("",80);
               this.buttonBuy.x = this.§_-i26§.x + this.§_-i26§.width + 22;
               this.buttonBuy.y = this.§_-i26§.y;
               this.buttonBuy.addEventListener(MouseEvent.CLICK,this.§_-t2C§);
               addChild(this.buttonBuy);
            }
            if(!this.§_-n2i§ || !this.§_-B11§)
            {
               this.§_-n2i§ = new §_-i5§(gls("На день"),0,0,§_-C1Q§,80);
               this.§_-n2i§.x = 17;
               this.§_-n2i§.y = 182;
               addChild(this.§_-n2i§);
               this.§_-B11§ = new §_-i5§(gls("Навсегда"),0,0,§_-C1Q§,80);
               this.§_-B11§.x = this.§_-n2i§.x + this.§_-n2i§.width + 22;
               this.§_-B11§.y = this.§_-n2i§.y;
               addChild(this.§_-B11§);
            }
            this.§_-i26§.field.text = §_-P2x§.§_-O1c§(this.id) + " *";
            this.§_-i26§.clear();
            this.§_-i26§.redraw();
            §_-K1Y§.§_-P2W§(this.§_-i26§.field,"*",ImageIconCoins,0.7,0.7,-this.§_-i26§.field.x,-3,false,false);
            this.buttonBuy.field.text = §_-P2x§.getPackageCoinsPrice(this.id) + " *";
            this.buttonBuy.clear();
            this.buttonBuy.redraw();
            §_-K1Y§.§_-P2W§(this.buttonBuy.field,"*",ImageIconCoins,0.7,0.7,-this.buttonBuy.field.x,-3,false,false);
            if(§_-L1o§.§_-G2K§(this.id))
            {
               if(!this.§_-Ja§)
               {
                  this.§_-Ja§ = new §_-918§(this.id);
                  this.§_-Ja§.x = (this.back.width - this.§_-Ja§.width) * 0.5;
                  this.§_-Ja§.y = 45;
               }
               addChild(this.§_-Ja§);
            }
            else if(Boolean(this.§_-Ja§) && contains(this.§_-Ja§))
            {
               removeChild(this.§_-Ja§);
            }
         }
         else
         {
            if(!this.§_-q1l§)
            {
               this.§_-q1l§ = new §_-RT§(§_-RT§.§_-ZS§);
               this.§_-q1l§.x = 45;
               this.§_-q1l§.y = 194;
               addChild(this.§_-q1l§);
            }
            if(Boolean(this.§_-i26§) && Boolean(this.buttonBuy))
            {
               this.§_-i26§.visible = this.buttonBuy.visible = false;
            }
            if(Boolean(this.§_-n2i§) && Boolean(this.§_-B11§))
            {
               this.§_-n2i§.visible = this.§_-B11§.visible = false;
            }
            if(Boolean(this.§_-Ja§) && contains(this.§_-Ja§))
            {
               removeChild(this.§_-Ja§);
            }
         }
      }
      
      private function §_-t2C§(param1:MouseEvent) : void
      {
         if(§_-P2x§.§_-ZR§(this.id))
         {
            Game.§_-u2z§(§_-u1O§.§_-Z2l§,§_-P2x§.getPackageCoinsPrice(this.id),0,Game.selfId,this.id);
         }
         else if(§_-L1o§.§_-02s§(§_-P2x§.§_-93Q§(this.id)))
         {
            Game.§_-u2z§(§_-u1O§.§_-j1U§,§_-P2x§.getPackageCoinsPrice(this.id),0,Game.selfId,this.id);
         }
         else
         {
            §_-B26§.show(this.id);
         }
      }
      
      private function §_-p14§(param1:MouseEvent) : void
      {
         if(§_-P2x§.§_-ZR§(this.id))
         {
            Game.§_-u2z§(§_-u1O§.§_-q2B§,§_-P2x§.§_-O1c§(this.id),0,Game.selfId,this.id);
         }
         else if(§_-L1o§.§_-02s§(§_-P2x§.§_-93Q§(this.id)))
         {
            Game.§_-u2z§(§_-u1O§.§_-012§,§_-P2x§.§_-O1c§(this.id),0,Game.selfId,this.id);
         }
         else
         {
            §_-B26§.show(this.id,true);
         }
      }
   }
}


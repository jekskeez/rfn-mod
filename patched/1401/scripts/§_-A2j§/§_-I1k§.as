package §_-A2j§
{
   import §_-D2q§.§_-M2D§;
   import §_-I10§.§_-g1R§;
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-d10§.§_-s2E§;
   import §_-l2q§.§_-u1c§;
   import buttons.§_-j18§;
   import events.GameEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.§_-h2B§;
   import tape.§_-A3s§;
   import utils.§_-jB§;
   import views.§_-52O§;
   import views.§_-W1y§;
   
   public class §_-I1k§ extends §_-A3s§
   {
      
      private static const §_-CD§:TextFormat = new TextFormat(null,12,8674113,true);
      
      private var icon:§_-W1y§;
      
      private var §_-V1Z§:§_-22V§ = null;
      
      private var §_-It§:§_-22V§ = null;
      
      private var §_-S1M§:§_-j18§ = null;
      
      private var buttonBuy:§_-j18§ = null;
      
      private var §_-21J§:§_-s2E§ = null;
      
      private var §_-R2e§:§_-52O§ = null;
      
      public function §_-I1k§(param1:int)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         var _loc2_:§_-u1c§ = null;
         super.init();
         this.§_-Nh§ = new ElementPackageLargeBackSelected();
         this.§_-Nh§.visible = false;
         addChild(this.§_-Nh§);
         this.back = new ElementPackageLargeBack();
         addChild(this.back);
         var _loc1_:§_-22V§ = new §_-22V§(§_-g2W§.§_-G1Y§(this.id),30,5,new TextFormat(§_-22V§.§_-F2z§,16,6697728,true,null,null,null,null,"center"),125);
         addChild(_loc1_);
         this.icon = new §_-W1y§(this.id);
         this.icon.scaleX = this.icon.scaleY = 0.72;
         this.icon.x = int((this.back.width - this.icon.width) * 0.5);
         this.icon.y = int((this.back.height - this.icon.height) * 0.5);
         addChild(this.icon);
         if(§_-g2W§.§_-w2o§(this.id).length > 0)
         {
            _loc2_ = new §_-u1c§(§_-g2W§.§_-w2o§(this.id)[0]);
            _loc2_.width = _loc2_.height = 30;
            _loc2_.x = 175;
            _loc2_.y = 20;
            addChild(_loc2_);
         }
         this.update();
         §_-h1f§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.update);
         §_-g1R§.addEventListener(GameEvent.CLOSEOUT_START,this.update);
         §_-g1R§.addEventListener(GameEvent.CLOSEOUT_END,this.update);
      }
      
      protected function update(param1:GameEvent = null) : void
      {
         if(!§_-h1f§.§_-Nf§(this.id))
         {
            if(!this.§_-S1M§ || !this.buttonBuy)
            {
               this.§_-S1M§ = new §_-j18§("",80);
               this.§_-S1M§.x = 7;
               this.§_-S1M§.y = 202;
               this.§_-S1M§.addEventListener(MouseEvent.CLICK,this.§_-71l§);
               addChild(this.§_-S1M§);
               this.buttonBuy = new §_-j18§("",80);
               this.buttonBuy.x = this.§_-S1M§.x + this.§_-S1M§.width + 22;
               this.buttonBuy.y = this.§_-S1M§.y;
               this.buttonBuy.addEventListener(MouseEvent.CLICK,this.§_-u1Z§);
               addChild(this.buttonBuy);
            }
            if(!this.§_-V1Z§ || !this.§_-It§)
            {
               this.§_-V1Z§ = new §_-22V§(gls("На день"),0,0,§_-CD§,80);
               this.§_-V1Z§.x = 17;
               this.§_-V1Z§.y = 182;
               addChild(this.§_-V1Z§);
               this.§_-It§ = new §_-22V§(gls("Навсегда"),0,0,§_-CD§,80);
               this.§_-It§.x = this.§_-V1Z§.x + this.§_-V1Z§.width + 22;
               this.§_-It§.y = this.§_-V1Z§.y;
               addChild(this.§_-It§);
            }
            this.§_-S1M§.field.text = §_-g2W§.§_-BA§(this.id) + " *";
            this.§_-S1M§.clear();
            this.§_-S1M§.redraw();
            §_-jB§.§_-fG§(this.§_-S1M§.field,"*",ImageIconCoins,0.7,0.7,-this.§_-S1M§.field.x,-3,false,false);
            this.buttonBuy.field.text = §_-g2W§.getPackageCoinsPrice(this.id) + " *";
            this.buttonBuy.clear();
            this.buttonBuy.redraw();
            §_-jB§.§_-fG§(this.buttonBuy.field,"*",ImageIconCoins,0.7,0.7,-this.buttonBuy.field.x,-3,false,false);
            if(§_-h1f§.§_-62P§(this.id))
            {
               if(!this.§_-R2e§)
               {
                  this.§_-R2e§ = new §_-52O§(this.id);
                  this.§_-R2e§.x = (this.back.width - this.§_-R2e§.width) * 0.5;
                  this.§_-R2e§.y = 45;
               }
               addChild(this.§_-R2e§);
            }
            else if(Boolean(this.§_-R2e§) && contains(this.§_-R2e§))
            {
               removeChild(this.§_-R2e§);
            }
         }
         else
         {
            if(!this.§_-21J§)
            {
               this.§_-21J§ = new §_-s2E§(§_-s2E§.§_-jI§);
               this.§_-21J§.x = 45;
               this.§_-21J§.y = 194;
               addChild(this.§_-21J§);
            }
            if(Boolean(this.§_-S1M§) && Boolean(this.buttonBuy))
            {
               this.§_-S1M§.visible = this.buttonBuy.visible = false;
            }
            if(Boolean(this.§_-V1Z§) && Boolean(this.§_-It§))
            {
               this.§_-V1Z§.visible = this.§_-It§.visible = false;
            }
            if(Boolean(this.§_-R2e§) && contains(this.§_-R2e§))
            {
               removeChild(this.§_-R2e§);
            }
         }
      }
      
      private function §_-u1Z§(param1:MouseEvent) : void
      {
         if(§_-g2W§.§_-CZ§(this.id))
         {
            Game.§_-K2t§(§_-h2B§.§_-a2Z§,§_-g2W§.getPackageCoinsPrice(this.id),0,Game.selfId,this.id);
         }
         else if(§_-h1f§.§_-x1C§(§_-g2W§.§_-s1h§(this.id)))
         {
            Game.§_-K2t§(§_-h2B§.§_-m1U§,§_-g2W§.getPackageCoinsPrice(this.id),0,Game.selfId,this.id);
         }
         else
         {
            §_-M2D§.show(this.id);
         }
      }
      
      private function §_-71l§(param1:MouseEvent) : void
      {
         if(§_-g2W§.§_-CZ§(this.id))
         {
            Game.§_-K2t§(§_-h2B§.§_-F1b§,§_-g2W§.§_-BA§(this.id),0,Game.selfId,this.id);
         }
         else if(§_-h1f§.§_-x1C§(§_-g2W§.§_-s1h§(this.id)))
         {
            Game.§_-K2t§(§_-h2B§.§_-s2Z§,§_-g2W§.§_-BA§(this.id),0,Game.selfId,this.id);
         }
         else
         {
            §_-M2D§.show(this.id,true);
         }
      }
   }
}


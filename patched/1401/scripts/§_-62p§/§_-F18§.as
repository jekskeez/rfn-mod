package §_-62p§
{
   import §_-A2j§.§_-d1v§;
   import §_-D2q§.§_-M2D§;
   import §_-D2q§.§_-m1L§;
   import §_-I10§.§_-g1R§;
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-d10§.§_-RA§;
   import §_-d10§.§_-s2E§;
   import §_-l2q§.§_-u1c§;
   import §_-r2Y§.§_-33e§;
   import §_-z2Z§.§_-ps§;
   import buttons.§_-j18§;
   import events.GameEvent;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.§_-h2B§;
   import tape.§_-91w§;
   import utils.§_-jB§;
   import views.§_-52O§;
   import views.§_-W1y§;
   
   public class §_-F18§ extends Sprite
   {
      
      private static const §_-a1Y§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,20,6697728,null,null,null,null,null,"center");
      
      private static const §_-CD§:TextFormat = new TextFormat(null,12,8674113,true);
      
      protected var §_-Nh§:MovieClip = null;
      
      protected var §_-21J§:§_-s2E§ = null;
      
      protected var §_-R2e§:§_-52O§ = null;
      
      protected var §_-t2j§:§_-RA§ = null;
      
      private var id:int = -1;
      
      private var §_-e1d§:Boolean = false;
      
      private var §_-D27§:int = 0;
      
      private var §_-TR§:Boolean = false;
      
      private var isBought:Boolean = false;
      
      private var §_-S1M§:§_-j18§ = null;
      
      private var buttonBuy:§_-j18§ = null;
      
      private var §_-5f§:SimpleButton = null;
      
      private var §_-V1Z§:§_-22V§ = null;
      
      private var §_-It§:§_-22V§ = null;
      
      private var §_-T1j§:§_-22V§ = null;
      
      private var §_-Xk§:§_-W1y§ = null;
      
      private var §_-91d§:§_-ps§ = null;
      
      public function §_-F18§(param1:int, param2:Boolean = false, param3:Boolean = true)
      {
         var _loc6_:NotificationAnimationView = null;
         var _loc7_:§_-u1c§ = null;
         super();
         this.id = param1;
         this.§_-e1d§ = param2;
         var _loc4_:int = this.§_-e1d§ ? -1 : §_-g2W§.§_-41l§(this.id);
         this.§_-D27§ = _loc4_ == -1 ? int(§_-g2W§.§_-W2m§(this.id)[0]) : _loc4_;
         var _loc5_:ElementPackageBack = new ElementPackageBack();
         _loc5_.height = 390;
         addChild(_loc5_);
         this.§_-Nh§ = new ElementPackageBackSelectedGreen();
         this.§_-Nh§.height = 390;
         this.§_-Nh§.visible = false;
         addChild(this.§_-Nh§);
         if(!this.§_-e1d§ && §_-g2W§.§_-bB§(this.id))
         {
            _loc6_ = new NotificationAnimationView();
            _loc6_.x = 8;
            _loc6_.y = 10;
            addChild(_loc6_);
         }
         this.§_-T1j§ = new §_-22V§(§_-g2W§.§_-G1Y§(this.§_-D27§),20,3,§_-a1Y§,_loc5_.width - 40);
         addChild(this.§_-T1j§);
         this.§_-5f§ = new ButtonShowMore();
         this.§_-5f§.x = 180;
         this.§_-5f§.y = 260;
         this.§_-5f§.scaleX = this.§_-5f§.scaleY = 2;
         this.§_-5f§.addEventListener(MouseEvent.CLICK,this.§_-31u§);
         this.§_-5f§.visible = !this.§_-e1d§;
         addChild(this.§_-5f§);
         this.§_-V1Z§ = new §_-22V§(gls("На день"),0,0,§_-CD§);
         this.§_-V1Z§.x = 50 - int(this.§_-V1Z§.textWidth * 0.5);
         if(this.§_-e1d§)
         {
            addChild(this.§_-V1Z§);
         }
         this.§_-S1M§ = new §_-j18§("",80);
         this.§_-S1M§.x = 10;
         this.§_-S1M§.y = _loc5_.height - int(this.§_-S1M§.height * 0.5);
         this.§_-V1Z§.y = this.§_-S1M§.y - 20;
         this.§_-S1M§.addEventListener(MouseEvent.CLICK,this.§_-71l§);
         if(this.§_-e1d§)
         {
            addChild(this.§_-S1M§);
         }
         this.§_-It§ = new §_-22V§(gls("Навсегда"),0,0,§_-CD§);
         this.§_-It§.x = (this.§_-e1d§ ? 160 : 105) - int(this.§_-It§.textWidth * 0.5);
         if(this.§_-e1d§)
         {
            addChild(this.§_-It§);
         }
         this.buttonBuy = new §_-j18§("",80);
         this.buttonBuy.x = this.§_-e1d§ ? 120 : 65;
         this.buttonBuy.y = _loc5_.height - int(this.buttonBuy.height * 0.5);
         this.§_-It§.y = this.buttonBuy.y - 20;
         this.buttonBuy.addEventListener(MouseEvent.CLICK,this.§_-u1Z§);
         addChild(this.buttonBuy);
         if(!this.§_-e1d§)
         {
            this.§_-91d§ = new §_-ps§(55,8,2,false);
            this.§_-91d§.x = 76;
            this.§_-91d§.y = 280;
            addChild(this.§_-91d§);
         }
         else if(§_-g2W§.§_-w2o§(this.§_-D27§).length > 0)
         {
            _loc7_ = new §_-u1c§(§_-g2W§.§_-w2o§(this.§_-D27§)[0]);
            _loc7_.width = _loc7_.height = 30;
            _loc7_.x = 185;
            _loc7_.y = 20;
            addChild(_loc7_);
         }
         if(!param3)
         {
            return;
         }
         this.§_-027§();
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.§_-Nh§.visible = param1;
      }
      
      public function §_-027§() : void
      {
         var data:§_-91w§;
         var i:int;
         if(this.§_-TR§)
         {
            return;
         }
         this.§_-V21§();
         this.update();
         §_-h1f§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.update);
         §_-g1R§.addEventListener(GameEvent.CLOSEOUT_START,this.update);
         §_-g1R§.addEventListener(GameEvent.CLOSEOUT_END,this.update);
         if(!this.§_-91d§)
         {
            return;
         }
         data = new §_-91w§(§_-d1v§);
         data.setData(§_-g2W§.§_-W2m§(this.id).filter(function(param1:int, param2:int, param3:Array):Boolean
         {
            if(Boolean(param2) || Boolean(param3))
            {
            }
            return §_-g2W§.getPackageCoinsPrice(param1) != 0;
         }));
         this.§_-91d§.setData(data);
         i = 0;
         while(i < data.objects.length)
         {
            if((data.objects[i] as §_-d1v§).id == this.§_-D27§)
            {
               this.§_-91d§.select(data.objects[i] as §_-d1v§);
               break;
            }
            i++;
         }
         this.§_-91d§.addEventListener(§_-33e§.SELECTED,this.§_-91N§);
      }
      
      private function update(param1:GameEvent = null) : void
      {
         var _loc2_:int = 0;
         var _loc3_:§_-91w§ = null;
         var _loc4_:int = 0;
         this.§_-TR§ = true;
         this.isBought = §_-h1f§.§_-Nf§(this.§_-D27§);
         if(Boolean(param1) && Boolean(param1.type == GameEvent.CLOTHES_STORAGE_CHANGE) && this.isBought)
         {
            _loc2_ = this.§_-e1d§ ? -1 : §_-g2W§.§_-41l§(this.id);
            if(_loc2_ != -1)
            {
               this.§_-D27§ = _loc2_;
               _loc3_ = this.§_-91d§.§_-H1Q§() as §_-91w§;
               _loc4_ = 0;
               while(_loc4_ < _loc3_.objects.length)
               {
                  if((_loc3_.objects[_loc4_] as §_-d1v§).id == this.§_-D27§)
                  {
                     this.§_-91d§.select(_loc3_.objects[_loc4_] as §_-d1v§);
                     break;
                  }
                  _loc4_++;
               }
            }
         }
         if(this.isBought)
         {
            if(!this.§_-21J§)
            {
               this.§_-21J§ = new §_-s2E§(§_-s2E§.§_-jI§);
               this.§_-21J§.x = 50;
               this.§_-21J§.y = 372;
               addChild(this.§_-21J§);
            }
            else
            {
               this.§_-21J§.visible = true;
            }
         }
         else if(this.§_-21J§)
         {
            this.§_-21J§.visible = false;
         }
         if(§_-h1f§.§_-62P§(this.§_-D27§))
         {
            if(!this.§_-R2e§)
            {
               this.§_-R2e§ = new §_-52O§(this.§_-D27§);
               this.§_-R2e§.x = 105 - int(this.§_-R2e§.width * 0.5);
               this.§_-R2e§.y = 60;
            }
            this.§_-R2e§.id = this.§_-D27§;
            addChild(this.§_-R2e§);
         }
         else if(Boolean(this.§_-R2e§) && contains(this.§_-R2e§))
         {
            removeChild(this.§_-R2e§);
         }
         this.§_-S1M§.field.text = §_-g2W§.§_-BA§(this.§_-D27§) + " *";
         this.§_-S1M§.clear();
         this.§_-S1M§.redraw();
         §_-jB§.§_-fG§(this.§_-S1M§.field,"*",ImageIconCoins,0.7,0.7,-this.§_-S1M§.field.x,-3,false,false);
         this.buttonBuy.field.text = §_-g2W§.getPackageCoinsPrice(this.§_-D27§) + " *";
         this.buttonBuy.clear();
         this.buttonBuy.redraw();
         this.buttonBuy.visible = !this.isBought;
         §_-jB§.§_-fG§(this.buttonBuy.field,"*",ImageIconCoins,0.7,0.7,-this.buttonBuy.field.x,-3,false,false);
         this.§_-S1M§.visible = !this.isBought;
         this.§_-It§.visible = !this.isBought;
         this.§_-V1Z§.visible = !this.isBought;
         this.§_-T1j§.text = §_-g2W§.§_-G1Y§(this.§_-D27§);
         if(this.§_-e1d§)
         {
            return;
         }
         if(§_-g1R§.§_-72d§(this.§_-D27§) == 1)
         {
            if(this.§_-t2j§)
            {
               this.§_-t2j§.visible = false;
            }
         }
         else
         {
            if(!this.§_-t2j§)
            {
               this.§_-t2j§ = new §_-RA§();
               this.§_-t2j§.scaleX = this.§_-t2j§.scaleY = 0.8;
               this.§_-t2j§.§_-t2j§ = §_-g1R§.§_-j1h§;
               this.§_-t2j§.x = 2;
               this.§_-t2j§.y = 45;
               addChild(this.§_-t2j§);
            }
            setChildIndex(this.§_-t2j§,this.numChildren - 1);
         }
      }
      
      private function §_-V21§() : void
      {
         if(this.§_-Xk§)
         {
            removeChild(this.§_-Xk§);
         }
         this.§_-Xk§ = new §_-W1y§(this.§_-D27§);
         this.§_-Xk§.x = -55;
         this.§_-Xk§.y = 270 - this.§_-Xk§.height;
         addChild(this.§_-Xk§);
         addChild(this.§_-5f§);
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(16777215);
         _loc1_.graphics.drawRect(56,0,203,this.§_-Xk§.height);
         this.§_-Xk§.addChild(_loc1_);
         this.§_-Xk§.mask = _loc1_;
      }
      
      private function §_-91N§(param1:§_-33e§) : void
      {
         if(this.§_-91d§.§_-Y1y§ != null)
         {
            this.§_-D27§ = this.§_-91d§.§_-Y1y§.id;
         }
         else
         {
            this.§_-D27§ = §_-g2W§.§_-W2m§(this.id)[0];
         }
         this.§_-V21§();
         this.update();
      }
      
      private function §_-u1Z§(param1:MouseEvent) : void
      {
         if(§_-g2W§.§_-CZ§(this.§_-D27§))
         {
            Game.§_-K2t§(§_-h2B§.§_-a2Z§,§_-g2W§.getPackageCoinsPrice(this.§_-D27§),0,Game.selfId,this.§_-D27§);
         }
         else if(§_-h1f§.§_-x1C§(§_-g2W§.§_-s1h§(this.§_-D27§)))
         {
            Game.§_-K2t§(§_-h2B§.§_-m1U§,§_-g2W§.getPackageCoinsPrice(this.§_-D27§),0,Game.selfId,this.§_-D27§);
         }
         else
         {
            §_-M2D§.show(this.§_-D27§);
         }
      }
      
      private function §_-71l§(param1:MouseEvent) : void
      {
         Game.§_-K2t§(§_-h2B§.§_-F1b§,§_-g2W§.§_-BA§(this.§_-D27§),0,Game.selfId,this.§_-D27§);
      }
      
      private function §_-31u§(param1:MouseEvent) : void
      {
         §_-m1L§.§_-qc§(this.id,this.§_-D27§);
      }
   }
}


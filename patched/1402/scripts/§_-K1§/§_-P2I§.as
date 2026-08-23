package §_-K1§
{
   import §_-J19§.§_-534§;
   import §_-J19§.§_-B26§;
   import §_-O2Y§.§_-jD§;
   import §_-Qy§.§_-RT§;
   import §_-Qy§.§_-x2d§;
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-P2x§;
   import §_-X1k§.§_-y2L§;
   import §_-a11§.§_-h2m§;
   import §_-q24§.§_-72J§;
   import §_-z2V§.§_-D2g§;
   import buttons.§_-K2G§;
   import events.GameEvent;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.§_-u1O§;
   import tape.§_-o2N§;
   import utils.§_-K1Y§;
   import views.§_-918§;
   import views.§_-Y2D§;
   
   public class §_-P2I§ extends Sprite
   {
      
      private static const §_-W2U§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,20,6697728,null,null,null,null,null,"center");
      
      private static const §_-C1Q§:TextFormat = new TextFormat(null,12,8674113,true);
      
      protected var §_-Oh§:MovieClip = null;
      
      protected var §_-q1l§:§_-RT§ = null;
      
      protected var §_-Ja§:§_-918§ = null;
      
      protected var §_-52M§:§_-x2d§ = null;
      
      private var id:int = -1;
      
      private var §_-Mo§:Boolean = false;
      
      private var §_-ub§:int = 0;
      
      private var §_-52H§:Boolean = false;
      
      private var isBought:Boolean = false;
      
      private var §_-i26§:§_-K2G§ = null;
      
      private var buttonBuy:§_-K2G§ = null;
      
      private var §_-J2e§:SimpleButton = null;
      
      private var §_-n2i§:§_-i5§ = null;
      
      private var §_-B11§:§_-i5§ = null;
      
      private var §_-Q1w§:§_-i5§ = null;
      
      private var §_-jz§:§_-Y2D§ = null;
      
      private var §_-eO§:§_-D2g§ = null;
      
      public function §_-P2I§(param1:int, param2:Boolean = false, param3:Boolean = true)
      {
         var _loc6_:NotificationAnimationView = null;
         var _loc7_:§_-jD§ = null;
         super();
         this.id = param1;
         this.§_-Mo§ = param2;
         var _loc4_:int = this.§_-Mo§ ? -1 : §_-P2x§.§_-Ax§(this.id);
         this.§_-ub§ = _loc4_ == -1 ? int(§_-P2x§.§_-y18§(this.id)[0]) : _loc4_;
         var _loc5_:ElementPackageBack = new ElementPackageBack();
         _loc5_.height = 390;
         addChild(_loc5_);
         this.§_-Oh§ = new ElementPackageBackSelectedGreen();
         this.§_-Oh§.height = 390;
         this.§_-Oh§.visible = false;
         addChild(this.§_-Oh§);
         if(!this.§_-Mo§ && §_-P2x§.§_-rA§(this.id))
         {
            _loc6_ = new NotificationAnimationView();
            _loc6_.x = 8;
            _loc6_.y = 10;
            addChild(_loc6_);
         }
         this.§_-Q1w§ = new §_-i5§(§_-P2x§.§_-01H§(this.§_-ub§),20,3,§_-W2U§,_loc5_.width - 40);
         addChild(this.§_-Q1w§);
         this.§_-J2e§ = new ButtonShowMore();
         this.§_-J2e§.x = 180;
         this.§_-J2e§.y = 260;
         this.§_-J2e§.scaleX = this.§_-J2e§.scaleY = 2;
         this.§_-J2e§.addEventListener(MouseEvent.CLICK,this.§_-Z2§);
         this.§_-J2e§.visible = !this.§_-Mo§;
         addChild(this.§_-J2e§);
         this.§_-n2i§ = new §_-i5§(gls("На день"),0,0,§_-C1Q§);
         this.§_-n2i§.x = 50 - int(this.§_-n2i§.textWidth * 0.5);
         if(this.§_-Mo§)
         {
            addChild(this.§_-n2i§);
         }
         this.§_-i26§ = new §_-K2G§("",80);
         this.§_-i26§.x = 10;
         this.§_-i26§.y = _loc5_.height - int(this.§_-i26§.height * 0.5);
         this.§_-n2i§.y = this.§_-i26§.y - 20;
         this.§_-i26§.addEventListener(MouseEvent.CLICK,this.§_-p14§);
         if(this.§_-Mo§)
         {
            addChild(this.§_-i26§);
         }
         this.§_-B11§ = new §_-i5§(gls("Навсегда"),0,0,§_-C1Q§);
         this.§_-B11§.x = (this.§_-Mo§ ? 160 : 105) - int(this.§_-B11§.textWidth * 0.5);
         if(this.§_-Mo§)
         {
            addChild(this.§_-B11§);
         }
         this.buttonBuy = new §_-K2G§("",80);
         this.buttonBuy.x = this.§_-Mo§ ? 120 : 65;
         this.buttonBuy.y = _loc5_.height - int(this.buttonBuy.height * 0.5);
         this.§_-B11§.y = this.buttonBuy.y - 20;
         this.buttonBuy.addEventListener(MouseEvent.CLICK,this.§_-t2C§);
         addChild(this.buttonBuy);
         if(!this.§_-Mo§)
         {
            this.§_-eO§ = new §_-D2g§(55,8,2,false);
            this.§_-eO§.x = 76;
            this.§_-eO§.y = 280;
            addChild(this.§_-eO§);
         }
         else if(§_-P2x§.§_-G1S§(this.§_-ub§).length > 0)
         {
            _loc7_ = new §_-jD§(§_-P2x§.§_-G1S§(this.§_-ub§)[0]);
            _loc7_.width = _loc7_.height = 30;
            _loc7_.x = 185;
            _loc7_.y = 20;
            addChild(_loc7_);
         }
         if(!param3)
         {
            return;
         }
         this.§_-O1s§();
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.§_-Oh§.visible = param1;
      }
      
      public function §_-O1s§() : void
      {
         var data:§_-o2N§;
         var i:int;
         if(this.§_-52H§)
         {
            return;
         }
         this.§_-Z1x§();
         this.update();
         §_-L1o§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.update);
         §_-y2L§.addEventListener(GameEvent.CLOSEOUT_START,this.update);
         §_-y2L§.addEventListener(GameEvent.CLOSEOUT_END,this.update);
         if(!this.§_-eO§)
         {
            return;
         }
         data = new §_-o2N§(§_-72J§);
         data.setData(§_-P2x§.§_-y18§(this.id).filter(function(param1:int, param2:int, param3:Array):Boolean
         {
            if(Boolean(param2) || Boolean(param3))
            {
            }
            return §_-P2x§.getPackageCoinsPrice(param1) != 0;
         }));
         this.§_-eO§.setData(data);
         i = 0;
         while(i < data.objects.length)
         {
            if((data.objects[i] as §_-72J§).id == this.§_-ub§)
            {
               this.§_-eO§.select(data.objects[i] as §_-72J§);
               break;
            }
            i++;
         }
         this.§_-eO§.addEventListener(§_-h2m§.SELECTED,this.§_-h1u§);
      }
      
      private function update(param1:GameEvent = null) : void
      {
         var _loc2_:int = 0;
         var _loc3_:§_-o2N§ = null;
         var _loc4_:int = 0;
         this.§_-52H§ = true;
         this.isBought = §_-L1o§.§_-T1N§(this.§_-ub§);
         if(Boolean(param1) && Boolean(param1.type == GameEvent.CLOTHES_STORAGE_CHANGE) && this.isBought)
         {
            _loc2_ = this.§_-Mo§ ? -1 : §_-P2x§.§_-Ax§(this.id);
            if(_loc2_ != -1)
            {
               this.§_-ub§ = _loc2_;
               _loc3_ = this.§_-eO§.§_-n4§() as §_-o2N§;
               _loc4_ = 0;
               while(_loc4_ < _loc3_.objects.length)
               {
                  if((_loc3_.objects[_loc4_] as §_-72J§).id == this.§_-ub§)
                  {
                     this.§_-eO§.select(_loc3_.objects[_loc4_] as §_-72J§);
                     break;
                  }
                  _loc4_++;
               }
            }
         }
         if(this.isBought)
         {
            if(!this.§_-q1l§)
            {
               this.§_-q1l§ = new §_-RT§(§_-RT§.§_-ZS§);
               this.§_-q1l§.x = 50;
               this.§_-q1l§.y = 372;
               addChild(this.§_-q1l§);
            }
            else
            {
               this.§_-q1l§.visible = true;
            }
         }
         else if(this.§_-q1l§)
         {
            this.§_-q1l§.visible = false;
         }
         if(§_-L1o§.§_-G2K§(this.§_-ub§))
         {
            if(!this.§_-Ja§)
            {
               this.§_-Ja§ = new §_-918§(this.§_-ub§);
               this.§_-Ja§.x = 105 - int(this.§_-Ja§.width * 0.5);
               this.§_-Ja§.y = 60;
            }
            this.§_-Ja§.id = this.§_-ub§;
            addChild(this.§_-Ja§);
         }
         else if(Boolean(this.§_-Ja§) && contains(this.§_-Ja§))
         {
            removeChild(this.§_-Ja§);
         }
         this.§_-i26§.field.text = §_-P2x§.§_-O1c§(this.§_-ub§) + " *";
         this.§_-i26§.clear();
         this.§_-i26§.redraw();
         §_-K1Y§.§_-P2W§(this.§_-i26§.field,"*",ImageIconCoins,0.7,0.7,-this.§_-i26§.field.x,-3,false,false);
         this.buttonBuy.field.text = §_-P2x§.getPackageCoinsPrice(this.§_-ub§) + " *";
         this.buttonBuy.clear();
         this.buttonBuy.redraw();
         this.buttonBuy.visible = !this.isBought;
         §_-K1Y§.§_-P2W§(this.buttonBuy.field,"*",ImageIconCoins,0.7,0.7,-this.buttonBuy.field.x,-3,false,false);
         this.§_-i26§.visible = !this.isBought;
         this.§_-B11§.visible = !this.isBought;
         this.§_-n2i§.visible = !this.isBought;
         this.§_-Q1w§.text = §_-P2x§.§_-01H§(this.§_-ub§);
         if(this.§_-Mo§)
         {
            return;
         }
         if(§_-y2L§.§_-L8§(this.§_-ub§) == 1)
         {
            if(this.§_-52M§)
            {
               this.§_-52M§.visible = false;
            }
         }
         else
         {
            if(!this.§_-52M§)
            {
               this.§_-52M§ = new §_-x2d§();
               this.§_-52M§.scaleX = this.§_-52M§.scaleY = 0.8;
               this.§_-52M§.§_-52M§ = §_-y2L§.§_-b2n§;
               this.§_-52M§.x = 2;
               this.§_-52M§.y = 45;
               addChild(this.§_-52M§);
            }
            setChildIndex(this.§_-52M§,this.numChildren - 1);
         }
      }
      
      private function §_-Z1x§() : void
      {
         if(this.§_-jz§)
         {
            removeChild(this.§_-jz§);
         }
         this.§_-jz§ = new §_-Y2D§(this.§_-ub§);
         this.§_-jz§.x = -55;
         this.§_-jz§.y = 270 - this.§_-jz§.height;
         addChild(this.§_-jz§);
         addChild(this.§_-J2e§);
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(16777215);
         _loc1_.graphics.drawRect(56,0,203,this.§_-jz§.height);
         this.§_-jz§.addChild(_loc1_);
         this.§_-jz§.mask = _loc1_;
      }
      
      private function §_-h1u§(param1:§_-h2m§) : void
      {
         if(this.§_-eO§.§_-02G§ != null)
         {
            this.§_-ub§ = this.§_-eO§.§_-02G§.id;
         }
         else
         {
            this.§_-ub§ = §_-P2x§.§_-y18§(this.id)[0];
         }
         this.§_-Z1x§();
         this.update();
      }
      
      private function §_-t2C§(param1:MouseEvent) : void
      {
         if(§_-P2x§.§_-ZR§(this.§_-ub§))
         {
            Game.§_-u2z§(§_-u1O§.§_-Z2l§,§_-P2x§.getPackageCoinsPrice(this.§_-ub§),0,Game.selfId,this.§_-ub§);
         }
         else if(§_-L1o§.§_-02s§(§_-P2x§.§_-93Q§(this.§_-ub§)))
         {
            Game.§_-u2z§(§_-u1O§.§_-j1U§,§_-P2x§.getPackageCoinsPrice(this.§_-ub§),0,Game.selfId,this.§_-ub§);
         }
         else
         {
            §_-B26§.show(this.§_-ub§);
         }
      }
      
      private function §_-p14§(param1:MouseEvent) : void
      {
         Game.§_-u2z§(§_-u1O§.§_-q2B§,§_-P2x§.§_-O1c§(this.§_-ub§),0,Game.selfId,this.§_-ub§);
      }
      
      private function §_-Z2§(param1:MouseEvent) : void
      {
         §_-534§.§_-115§(this.id,this.§_-ub§);
      }
   }
}


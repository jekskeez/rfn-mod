package §_-Z24§
{
   import §_-42B§.TweenMax;
   import §_-68§.§_-EI§;
   import §_-H7§.§_-z1v§;
   import §_-I10§.§_-428§;
   import §_-I10§.§_-e1z§;
   import §_-I10§.§_-m2t§;
   import §_-e1G§.§_-Hb§;
   import buttons.§_-j18§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import utils.§_-r2N§;
   import views.§_-W1y§;
   
   public class §_-3§ extends Sprite
   {
      
      private static const §_-F1A§:String = "no";
      
      private static const §_-jz§:String = "get";
      
      private static const §_-d22§:String = "last";
      
      private static const §_-d9§:String = "passed";
      
      private static const §_-u1H§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,16,16774444,true);
      
      private static const TEXT_FORMAT:TextFormat = new TextFormat(§_-22V§.§_-F2z§,16,6439194,true);
      
      private static const §_-81m§:Array = [§_-428§.§_-wG§,§_-428§.§_-61Q§,§_-428§.§_-a1H§,§_-428§.§_-P13§,§_-428§.§_-O2P§,§_-428§.§_-113§,§_-428§.§_-dU§];
      
      private static const §_-u1C§:Array = [10,25,50,75,"1" + gls("д."),1,gls("сутки")];
      
      private static const §_-C19§:Array = [gls("{0} орехов"),gls("{0} энергии"),gls("{0} маны"),gls("{0} опыта"),gls("VIP-статус на {0}"),gls("{0} монетка"),gls("Костюм на {0}")];
      
      private var images:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var §_-c§:DisplayObject = null;
      
      private var §_-n11§:MovieClip = null;
      
      private var button:§_-j18§ = null;
      
      private var §_-o2E§:§_-22V§ = null;
      
      private var §_-aL§:§_-934§ = null;
      
      public function §_-3§()
      {
         super();
         this.init();
         §_-m2t§.addEventListener(GameEvent.DAILY_BONUS_UPDATE,this.update);
         §_-m2t§.addEventListener(GameEvent.DAILY_BONUS_GET,this.showAward);
      }
      
      private function init() : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:DailyBonusFrame = null;
         var _loc4_:§_-22V§ = null;
         var _loc5_:§_-m1C§ = null;
         var _loc1_:int = 0;
         while(_loc1_ < §_-81m§.length)
         {
            _loc2_ = new Sprite();
            _loc2_.x = 68 + 120 * _loc1_;
            _loc2_.mouseEnabled = false;
            addChild(_loc2_);
            _loc3_ = new DailyBonusFrame();
            _loc3_.gotoAndStop(§_-jz§);
            _loc3_.name = "bg";
            _loc2_.addChild(_loc3_);
            new §_-Hb§(_loc3_,gls(§_-C19§[_loc1_],§_-u1C§[_loc1_]));
            _loc4_ = new §_-22V§(gls("День {0}",_loc1_ + 1),0,-50,TEXT_FORMAT);
            _loc4_.x = -int(_loc4_.width * 0.5);
            _loc4_.mouseEnabled = false;
            _loc2_.addChild(_loc4_);
            _loc5_ = new §_-m1C§(§_-81m§[_loc1_],§_-u1C§[_loc1_]);
            _loc5_.x = -int(_loc5_.width * 0.5);
            _loc5_.y = -int(_loc5_.height * 0.5) + 7;
            _loc2_.addChild(_loc5_);
            if(_loc5_ is MovieClip && (_loc5_ as MovieClip).totalFrames > 1)
            {
               (_loc5_ as MovieClip).gotoAndStop(§_-a9§.§_-L2p§);
            }
            if(_loc1_ == §_-m2t§.§_-N1P§)
            {
               this.§_-c§ = _loc5_;
            }
            new §_-Hb§(_loc5_,gls(§_-C19§[_loc1_],§_-u1C§[_loc1_]));
            this.images.push(_loc2_);
            _loc1_++;
         }
         this.§_-n11§ = new DailyBonusMovieGlow();
         this.§_-n11§.mouseChildren = false;
         this.§_-n11§.mouseEnabled = false;
         this.§_-aL§ = new §_-934§();
         this.§_-aL§.x = 15;
         this.§_-aL§.y = 63;
         addChild(this.§_-aL§);
         this.button = new §_-j18§(gls("Забрать"),85);
         this.button.x = -43;
         this.button.y = 45;
         this.button.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
         this.update();
      }
      
      private function update(param1:GameEvent = null) : void
      {
         var i:int;
         var bg:MovieClip = null;
         var e:GameEvent = param1;
         this.§_-n11§.visible = §_-m2t§.§_-Pd§;
         this.button.visible = §_-m2t§.§_-Pd§;
         if(§_-m2t§.§_-Pd§)
         {
            this.images[§_-m2t§.§_-b2d§].addChildAt(this.§_-n11§,1);
            this.images[§_-m2t§.§_-b2d§].addChild(this.button);
            addChild(this.images[§_-m2t§.§_-b2d§]);
         }
         i = 0;
         while(i < this.images.length)
         {
            bg = (this.images[i] as Sprite).getChildByName("bg") as MovieClip;
            if(i == §_-m2t§.§_-N1P§ && §_-m2t§.§_-b2d§ >= i && !§_-m2t§.§_-Pd§)
            {
               bg.gotoAndStop(§_-d9§);
            }
            else if(i == §_-m2t§.§_-N1P§)
            {
               bg.gotoAndStop(§_-d22§);
            }
            else if(i < §_-m2t§.§_-b2d§ || i == §_-m2t§.§_-b2d§ && !§_-m2t§.§_-Pd§)
            {
               bg.gotoAndStop(§_-jz§);
            }
            else
            {
               bg.gotoAndStop(§_-F1A§);
            }
            i++;
         }
         this.§_-aL§.§_-y21§();
         if(§_-m2t§.§_-qW§ == -1)
         {
            return;
         }
         §_-EI§.load(function():void
         {
            showPackage();
         },true);
      }
      
      private function showPackage() : void
      {
         this.§_-c§.visible = false;
         var _loc1_:§_-W1y§ = new §_-W1y§(§_-m2t§.§_-qW§);
         _loc1_.scaleX = _loc1_.scaleY = 0.35;
         _loc1_.x = -int(_loc1_.width * 0.5);
         _loc1_.y = -int(_loc1_.height * 0.5);
         this.images[§_-m2t§.§_-N1P§].addChild(_loc1_);
         this.§_-o2E§ = new §_-22V§("",-4,0,new TextFormat(§_-22V§.§_-pJ§,20,12062479));
         this.§_-o2E§.filters = [new DropShadowFilter(0,0,0,1,4,4)];
         this.images[§_-m2t§.§_-N1P§].addChild(this.§_-o2E§);
         §_-01Y§.§_-c9§(this.§_-A1b§);
         this.§_-A1b§();
      }
      
      private function showAward(param1:GameEvent = null) : void
      {
         if(§_-m2t§.§_-b2d§ >= §_-81m§.length - 1)
         {
            return;
         }
         var _loc2_:int = §_-m2t§.§_-b2d§;
         var _loc3_:DisplayObject = new §_-z1v§(§_-81m§[_loc2_],§_-e1z§.VIP);
         _loc3_.scaleX = _loc3_.scaleY = 1.2;
         §_-r2N§.§_-A3v§(this.x + this.images[_loc2_].x,this.y + this.images[_loc2_].y,§_-u1C§[_loc2_],§_-81m§[_loc2_],_loc3_,0,§_-u1H§);
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         var image:DisplayObject = null;
         var e:MouseEvent = param1;
         §_-m2t§.§_-Pd§ = false;
         this.button.visible = §_-m2t§.§_-Pd§;
         image = this.images[§_-m2t§.§_-b2d§];
         TweenMax.to(image,0.1,{
            "scaleX":1.15,
            "scaleY":1.15,
            "onComplete":function():void
            {
               TweenMax.to(image,0.1,{
                  "scaleX":0.95,
                  "scaleY":0.95,
                  "onComplete":function():void
                  {
                     TweenMax.to(image,0.1,{
                        "scaleX":1.05,
                        "scaleY":1.05,
                        "onComplete":function():void
                        {
                           TweenMax.to(image,0.1,{
                              "scaleX":1,
                              "scaleY":1
                           });
                        }
                     });
                  }
               });
            }
         });
         TweenMax.to(this.§_-n11§,0.2,{
            "scaleX":1.5,
            "scaleY":1.5,
            "onComplete":function():void
            {
               TweenMax.to(§_-n11§,0.2,{
                  "scaleX":0.25,
                  "scaleY":0.25,
                  "onComplete":function():void
                  {
                     §_-n11§.visible = false;
                  }
               });
            }
         });
         Connection.§_-Li§(§_-h2B§.§_-72c§);
      }
      
      private function §_-A1b§() : void
      {
         if(!this.§_-o2E§)
         {
            return;
         }
         var _loc1_:int = Math.max(0,§_-m2t§.§_-un§ - int(getTimer() / 1000));
         this.§_-o2E§.text = new Date(0,0,0,0,0,_loc1_).toTimeString().slice(0,8);
         this.§_-o2E§.x = -int(this.§_-o2E§.textWidth * 0.5) - 4;
         if(_loc1_ == 0)
         {
            §_-01Y§.§_-l2K§(this.§_-A1b§);
         }
      }
   }
}


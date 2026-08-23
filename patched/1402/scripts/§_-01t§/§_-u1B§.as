package §_-01t§
{
   import §_-22D§.TweenMax;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-A3y§;
   import §_-X1k§.§_-X2k§;
   import §_-X1k§.§_-ku§;
   import §_-s2e§.§_-U2d§;
   import §_-u1R§.§_-g1m§;
   import buttons.§_-K2G§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import utils.§_-o1Q§;
   import views.§_-Y2D§;
   
   public class §_-u1B§ extends Sprite
   {
      
      private static const §_-m1r§:String = "no";
      
      private static const §_-Y0§:String = "get";
      
      private static const §_-g25§:String = "last";
      
      private static const §_-Gt§:String = "passed";
      
      private static const §_-p26§:TextFormat = new TextFormat(§_-i5§.§_-c10§,16,16774444,true);
      
      private static const TEXT_FORMAT:TextFormat = new TextFormat(§_-i5§.§_-c10§,16,6439194,true);
      
      private static const §_-F29§:Array = [§_-A3y§.§_-l2X§,§_-A3y§.§_-W27§,§_-A3y§.§_-fz§,§_-A3y§.§_-V2n§,§_-A3y§.§_-y2q§,§_-A3y§.§_-M1U§,§_-A3y§.§_-t1F§];
      
      private static const §_-p2x§:Array = [10,25,50,75,"1" + gls("д."),1,gls("сутки")];
      
      private static const §_-R1E§:Array = [gls("{0} орехов"),gls("{0} энергии"),gls("{0} маны"),gls("{0} опыта"),gls("VIP-статус на {0}"),gls("{0} монетка"),gls("Костюм на {0}")];
      
      private var images:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var §_-e24§:DisplayObject = null;
      
      private var §_-22B§:MovieClip = null;
      
      private var button:§_-K2G§ = null;
      
      private var §_-L1t§:§_-i5§ = null;
      
      private var §_-mz§:§_-93p§ = null;
      
      public function §_-u1B§()
      {
         super();
         this.init();
         §_-X2k§.addEventListener(GameEvent.DAILY_BONUS_UPDATE,this.update);
         §_-X2k§.addEventListener(GameEvent.DAILY_BONUS_GET,this.showAward);
      }
      
      private function init() : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:DailyBonusFrame = null;
         var _loc4_:§_-i5§ = null;
         var _loc5_:§_-mL§ = null;
         var _loc1_:int = 0;
         while(_loc1_ < §_-F29§.length)
         {
            _loc2_ = new Sprite();
            _loc2_.x = 68 + 120 * _loc1_;
            _loc2_.mouseEnabled = false;
            addChild(_loc2_);
            _loc3_ = new DailyBonusFrame();
            _loc3_.gotoAndStop(§_-Y0§);
            _loc3_.name = "bg";
            _loc2_.addChild(_loc3_);
            new §_-kr§(_loc3_,gls(§_-R1E§[_loc1_],§_-p2x§[_loc1_]));
            _loc4_ = new §_-i5§(gls("День {0}",_loc1_ + 1),0,-50,TEXT_FORMAT);
            _loc4_.x = -int(_loc4_.width * 0.5);
            _loc4_.mouseEnabled = false;
            _loc2_.addChild(_loc4_);
            _loc5_ = new §_-mL§(§_-F29§[_loc1_],§_-p2x§[_loc1_]);
            _loc5_.x = -int(_loc5_.width * 0.5);
            _loc5_.y = -int(_loc5_.height * 0.5) + 7;
            _loc2_.addChild(_loc5_);
            if(_loc5_ is MovieClip && (_loc5_ as MovieClip).totalFrames > 1)
            {
               (_loc5_ as MovieClip).gotoAndStop(§_-Zy§.§_-73r§);
            }
            if(_loc1_ == §_-X2k§.§_-o2t§)
            {
               this.§_-e24§ = _loc5_;
            }
            new §_-kr§(_loc5_,gls(§_-R1E§[_loc1_],§_-p2x§[_loc1_]));
            this.images.push(_loc2_);
            _loc1_++;
         }
         this.§_-22B§ = new DailyBonusMovieGlow();
         this.§_-22B§.mouseChildren = false;
         this.§_-22B§.mouseEnabled = false;
         this.§_-mz§ = new §_-93p§();
         this.§_-mz§.x = 15;
         this.§_-mz§.y = 63;
         addChild(this.§_-mz§);
         this.button = new §_-K2G§(gls("Забрать"),85);
         this.button.x = -43;
         this.button.y = 45;
         this.button.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
         this.update();
      }
      
      private function update(param1:GameEvent = null) : void
      {
         var i:int;
         var bg:MovieClip = null;
         var e:GameEvent = param1;
         this.§_-22B§.visible = §_-X2k§.§_-c2S§;
         this.button.visible = §_-X2k§.§_-c2S§;
         if(§_-X2k§.§_-c2S§)
         {
            this.images[§_-X2k§.§_-I1i§].addChildAt(this.§_-22B§,1);
            this.images[§_-X2k§.§_-I1i§].addChild(this.button);
            addChild(this.images[§_-X2k§.§_-I1i§]);
         }
         i = 0;
         while(i < this.images.length)
         {
            bg = (this.images[i] as Sprite).getChildByName("bg") as MovieClip;
            if(i == §_-X2k§.§_-o2t§ && §_-X2k§.§_-I1i§ >= i && !§_-X2k§.§_-c2S§)
            {
               bg.gotoAndStop(§_-Gt§);
            }
            else if(i == §_-X2k§.§_-o2t§)
            {
               bg.gotoAndStop(§_-g25§);
            }
            else if(i < §_-X2k§.§_-I1i§ || i == §_-X2k§.§_-I1i§ && !§_-X2k§.§_-c2S§)
            {
               bg.gotoAndStop(§_-Y0§);
            }
            else
            {
               bg.gotoAndStop(§_-m1r§);
            }
            i++;
         }
         this.§_-mz§.§_-q1o§();
         if(§_-X2k§.§_-nb§ == -1)
         {
            return;
         }
         §_-U2d§.load(function():void
         {
            showPackage();
         },true);
      }
      
      private function showPackage() : void
      {
         this.§_-e24§.visible = false;
         var _loc1_:§_-Y2D§ = new §_-Y2D§(§_-X2k§.§_-nb§);
         _loc1_.scaleX = _loc1_.scaleY = 0.35;
         _loc1_.x = -int(_loc1_.width * 0.5);
         _loc1_.y = -int(_loc1_.height * 0.5);
         this.images[§_-X2k§.§_-o2t§].addChild(_loc1_);
         this.§_-L1t§ = new §_-i5§("",-4,0,new TextFormat(§_-i5§.§_-p1s§,20,12062479));
         this.§_-L1t§.filters = [new DropShadowFilter(0,0,0,1,4,4)];
         this.images[§_-X2k§.§_-o2t§].addChild(this.§_-L1t§);
         §_-p1V§.§_-63T§(this.§_-62z§);
         this.§_-62z§();
      }
      
      private function showAward(param1:GameEvent = null) : void
      {
         if(§_-X2k§.§_-I1i§ >= §_-F29§.length - 1)
         {
            return;
         }
         var _loc2_:int = §_-X2k§.§_-I1i§;
         var _loc3_:DisplayObject = new §_-g1m§(§_-F29§[_loc2_],§_-ku§.VIP);
         _loc3_.scaleX = _loc3_.scaleY = 1.2;
         §_-o1Q§.§_-K2u§(this.x + this.images[_loc2_].x,this.y + this.images[_loc2_].y,§_-p2x§[_loc2_],§_-F29§[_loc2_],_loc3_,0,§_-p26§);
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         var image:DisplayObject = null;
         var e:MouseEvent = param1;
         §_-X2k§.§_-c2S§ = false;
         this.button.visible = §_-X2k§.§_-c2S§;
         image = this.images[§_-X2k§.§_-I1i§];
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
         TweenMax.to(this.§_-22B§,0.2,{
            "scaleX":1.5,
            "scaleY":1.5,
            "onComplete":function():void
            {
               TweenMax.to(§_-22B§,0.2,{
                  "scaleX":0.25,
                  "scaleY":0.25,
                  "onComplete":function():void
                  {
                     §_-22B§.visible = false;
                  }
               });
            }
         });
         Connection.§_-e2T§(§_-u1O§.§_-7r§);
      }
      
      private function §_-62z§() : void
      {
         if(!this.§_-L1t§)
         {
            return;
         }
         var _loc1_:int = Math.max(0,§_-X2k§.§_-lQ§ - int(getTimer() / 1000));
         this.§_-L1t§.text = new Date(0,0,0,0,0,_loc1_).toTimeString().slice(0,8);
         this.§_-L1t§.x = -int(this.§_-L1t§.textWidth * 0.5) - 4;
         if(_loc1_ == 0)
         {
            §_-p1V§.§_-B3x§(this.§_-62z§);
         }
      }
   }
}


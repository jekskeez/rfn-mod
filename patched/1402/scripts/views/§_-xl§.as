package views
{
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-93H§;
   import §_-X1k§.§_-EJ§;
   import §_-s2e§.§_-U2d§;
   import events.GameEvent;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import utils.§_-J1f§;
   
   public class §_-xl§ extends Sprite
   {
      
      private static const §_-nh§:int = 10;
      
      public static var §_-v1V§:Array = null;
      
      private var §_-ou§:Array = [];
      
      private var §_-Bd§:Sprite = new Sprite();
      
      private var §_-k1D§:Hero;
      
      public function §_-xl§()
      {
         super();
         §_-EJ§.addEventListener(GameEvent.SMILES_CHANGED,this.§_-w1T§);
         addChild(this.§_-Bd§);
      }
      
      public static function §_-83p§(param1:int) : Boolean
      {
         var _loc2_:Array = §_-93H§.§_-23K§(param1);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(§_-EJ§.smiles.indexOf(_loc2_[_loc3_]) == -1)
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      public static function get §_-z2k§() : Array
      {
         if(!§_-v1V§)
         {
            §_-v1V§ = [{
               "btn":MovieSmile7,
               "image":ImageSmile7,
               "frame":16
            },{
               "btn":MovieSmile0,
               "image":ImageSmile0,
               "frame":11
            },{
               "btn":MovieSmile3,
               "image":ImageSmile3,
               "frame":55
            },{
               "btn":MovieSmile6,
               "image":ImageSmile6,
               "frame":31,
               "shift":-10
            },{
               "btn":MovieSmile1,
               "image":ImageSmile1,
               "frame":42
            },{
               "btn":MovieSmile2,
               "image":ImageSmile2,
               "frame":37,
               "shift":-10
            },{
               "btn":MovieSmile5,
               "image":ImageSmile5,
               "frame":24
            },{
               "btn":MovieSmile9,
               "image":ImageSmile9,
               "frame":41
            },{
               "btn":MovieSmile4,
               "image":ImageSmile4,
               "frame":41
            },{
               "btn":MovieSmile8,
               "image":ImageSmile8,
               "frame":24
            },{
               "btn":EasterSmile0,
               "frame":11
            },{
               "btn":EasterSmile1,
               "frame":16,
               "shift":-9
            },{
               "btn":EasterSmile2,
               "frame":22
            },{
               "btn":EasterSmile3,
               "frame":21
            },{
               "btn":EasterSmile4,
               "frame":22
            },{
               "btn":NewYearSmile4,
               "frame":11
            },{
               "btn":NewYearSmile2,
               "frame":16
            },{
               "btn":NewYearSmile6,
               "frame":21
            },{
               "btn":NewYearSmile0,
               "frame":16,
               "shift":-9
            },{
               "btn":NewYearSmile9,
               "frame":9
            },{
               "btn":NewYearSmile8,
               "frame":52,
               "shift":-7
            },{
               "btn":NewYearSmile5,
               "frame":14
            },{
               "btn":NewYearSmile7,
               "frame":24
            },{
               "btn":NewYearSmile3,
               "frame":22
            },{
               "btn":NewYearSmile1,
               "frame":16
            },{
               "btn":MovieSmile10,
               "image":ImageSmile10,
               "frame":24
            },{
               "btn":MovieSmile11,
               "image":ImageSmile11,
               "frame":14
            },{
               "btn":MovieSmile12,
               "image":ImageSmile12,
               "frame":50
            },{
               "btn":MovieSmile13,
               "image":ImageSmile13,
               "frame":28
            }];
         }
         return §_-v1V§;
      }
      
      public function get hero() : Hero
      {
         return this.§_-k1D§;
      }
      
      public function set hero(param1:Hero) : void
      {
         this.§_-k1D§ = param1;
      }
      
      public function §_-B3k§() : void
      {
         var _loc3_:Sprite = null;
         var _loc4_:MovieClip = null;
         while(this.§_-Bd§.numChildren > 0)
         {
            this.§_-Bd§.removeChildAt(0);
         }
         this.§_-ou§.splice(0);
         var _loc1_:int = 0;
         while(_loc1_ < §_-z2k§.length)
         {
            if(§_-EJ§.smiles.indexOf(_loc1_) != -1)
            {
               _loc3_ = new Sprite();
               if("image" in §_-z2k§[_loc1_])
               {
                  _loc4_ = new §_-z2k§[_loc1_]["image"]();
                  _loc4_.stop();
               }
               else
               {
                  _loc4_ = new §_-z2k§[_loc1_]["btn"]();
                  _loc4_.gotoAndStop(§_-z2k§[_loc1_]["frame"]);
               }
               _loc3_.name = _loc1_.toString();
               _loc3_.addChild(§_-J1f§.replace(_loc4_));
               _loc3_.graphics.beginFill(0,0);
               _loc3_.graphics.drawCircle(0,0,25);
               _loc3_.x = 25 + this.§_-ou§.length % §_-nh§ * 40;
               _loc3_.y = 16 + 40 * int(this.§_-ou§.length / §_-nh§);
               _loc3_.scaleX = _loc3_.scaleY = 0.9;
               _loc3_.buttonMode = true;
               new §_-kr§(_loc3_,§_-EJ§.§_-X2R§[_loc1_]);
               _loc3_.addEventListener(MouseEvent.CLICK,this.§_-73j§);
               this.§_-Bd§.addChild(_loc3_);
               this.§_-ou§.push(_loc3_);
            }
            _loc1_++;
         }
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.beginFill(0,0.25);
         _loc2_.graphics.drawRoundRectComplex(0,-10,10 + Math.min(this.§_-ou§.length,§_-nh§) * 40,40 * int((this.§_-ou§.length - 1) / §_-nh§ + 1) + 10,10,10,10,10);
         _loc2_.graphics.endFill();
         this.§_-Bd§.addChildAt(_loc2_,0);
         this.§_-Bd§.x = (§_-nh§ - Math.min(this.§_-ou§.length,§_-nh§)) * 20;
         this.§_-Bd§.y = -40 * int((this.§_-ou§.length - 1) / §_-nh§);
      }
      
      private function §_-w1T§(param1:GameEvent) : void
      {
         if(!§_-U2d§.loaded)
         {
            return;
         }
         if(§_-EJ§.smiles.length == 0)
         {
            return;
         }
         this.§_-B3k§();
      }
      
      private function §_-73j§(param1:MouseEvent) : void
      {
         if(!this.hero || this.hero.isDead)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-ou§.length)
         {
            if(param1.currentTarget == this.§_-ou§[_loc2_])
            {
               this.hero.§_-73j§(int(param1.currentTarget.name) + Hero.§_-113§);
               Connection.§_-e2T§(§_-u1O§.§_-q13§,int(param1.currentTarget.name));
               break;
            }
            _loc2_++;
         }
      }
   }
}


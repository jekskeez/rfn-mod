package views
{
   import §_-68§.§_-EI§;
   import §_-I10§.§_-01k§;
   import §_-I10§.§_-8S§;
   import §_-e1G§.§_-Hb§;
   import events.GameEvent;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import utils.§_-A3M§;
   
   public class §_-l1b§ extends Sprite
   {
      
      private static const §_-YQ§:int = 10;
      
      public static var §_-B1I§:Array = null;
      
      private var §_-u8§:Array = [];
      
      private var §_-73t§:Sprite = new Sprite();
      
      private var §_-sB§:Hero;
      
      public function §_-l1b§()
      {
         super();
         §_-01k§.addEventListener(GameEvent.SMILES_CHANGED,this.§_-Hp§);
         addChild(this.§_-73t§);
      }
      
      public static function §_-pq§(param1:int) : Boolean
      {
         var _loc2_:Array = §_-8S§.§_-ic§(param1);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(§_-01k§.smiles.indexOf(_loc2_[_loc3_]) == -1)
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      public static function get §_-02E§() : Array
      {
         if(!§_-B1I§)
         {
            §_-B1I§ = [{
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
         return §_-B1I§;
      }
      
      public function get hero() : Hero
      {
         return this.§_-sB§;
      }
      
      public function set hero(param1:Hero) : void
      {
         this.§_-sB§ = param1;
      }
      
      public function §_-p2s§() : void
      {
         var _loc3_:Sprite = null;
         var _loc4_:MovieClip = null;
         while(this.§_-73t§.numChildren > 0)
         {
            this.§_-73t§.removeChildAt(0);
         }
         this.§_-u8§.splice(0);
         var _loc1_:int = 0;
         while(_loc1_ < §_-02E§.length)
         {
            if(§_-01k§.smiles.indexOf(_loc1_) != -1)
            {
               _loc3_ = new Sprite();
               if("image" in §_-02E§[_loc1_])
               {
                  _loc4_ = new §_-02E§[_loc1_]["image"]();
                  _loc4_.stop();
               }
               else
               {
                  _loc4_ = new §_-02E§[_loc1_]["btn"]();
                  _loc4_.gotoAndStop(§_-02E§[_loc1_]["frame"]);
               }
               _loc3_.name = _loc1_.toString();
               _loc3_.addChild(§_-A3M§.replace(_loc4_));
               _loc3_.graphics.beginFill(0,0);
               _loc3_.graphics.drawCircle(0,0,25);
               _loc3_.x = 25 + this.§_-u8§.length % §_-YQ§ * 40;
               _loc3_.y = 16 + 40 * int(this.§_-u8§.length / §_-YQ§);
               _loc3_.scaleX = _loc3_.scaleY = 0.9;
               _loc3_.buttonMode = true;
               new §_-Hb§(_loc3_,§_-01k§.§_-ZC§[_loc1_]);
               _loc3_.addEventListener(MouseEvent.CLICK,this.§_-Ci§);
               this.§_-73t§.addChild(_loc3_);
               this.§_-u8§.push(_loc3_);
            }
            _loc1_++;
         }
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.beginFill(0,0.25);
         _loc2_.graphics.drawRoundRectComplex(0,-10,10 + Math.min(this.§_-u8§.length,§_-YQ§) * 40,40 * int((this.§_-u8§.length - 1) / §_-YQ§ + 1) + 10,10,10,10,10);
         _loc2_.graphics.endFill();
         this.§_-73t§.addChildAt(_loc2_,0);
         this.§_-73t§.x = (§_-YQ§ - Math.min(this.§_-u8§.length,§_-YQ§)) * 20;
         this.§_-73t§.y = -40 * int((this.§_-u8§.length - 1) / §_-YQ§);
      }
      
      private function §_-Hp§(param1:GameEvent) : void
      {
         if(!§_-EI§.loaded)
         {
            return;
         }
         if(§_-01k§.smiles.length == 0)
         {
            return;
         }
         this.§_-p2s§();
      }
      
      private function §_-Ci§(param1:MouseEvent) : void
      {
         if(!this.hero || this.hero.isDead)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-u8§.length)
         {
            if(param1.currentTarget == this.§_-u8§[_loc2_])
            {
               this.hero.§_-Ci§(int(param1.currentTarget.name) + Hero.§_-wo§);
               Connection.§_-Li§(§_-h2B§.§_-j1U§,int(param1.currentTarget.name));
               break;
            }
            _loc2_++;
         }
      }
   }
}


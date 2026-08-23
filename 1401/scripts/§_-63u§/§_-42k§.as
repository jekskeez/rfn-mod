package §_-63u§
{
   import §_-5C§.ListDataEvent;
   import §_-A2x§.§_-33A§;
   import §_-I10§.§_-Br§;
   import §_-X1o§.§_-jo§;
   import §_-e1G§.§_-Hb§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.DropShadowFilter;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import sounds.GameSounds;
   import utils.StringUtil;
   import utils.§_-63K§;
   import utils.§_-ex§;
   import utils.§_-nO§;
   import views.§_-Si§;
   
   public class §_-42k§ extends §_-31r§
   {
      
      private static const TEXT_FORMAT:TextFormat = new TextFormat(§_-22V§.§_-pJ§,90,16777215,null,null,null,null,null,TextFormatAlign.CENTER);
      
      private var §_-k2i§:§_-22V§ = null;
      
      private var §_-31T§:§_-22V§ = null;
      
      protected var §_-j2N§:§_-22V§ = null;
      
      protected var §_-13L§:§_-22V§ = null;
      
      protected var §_-H2Q§:Sprite = null;
      
      private var §_-kf§:DisplayObject = null;
      
      private var §_-Z§:int = -1;
      
      private var §_-Im§:Boolean = false;
      
      public function §_-42k§()
      {
         super(MovieEndRoundDeath);
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-p1B§();
         §_-63K§.§_-e2l§(this.animation);
         if(this.§_-Im§)
         {
            GameSounds.play("dialog_place");
         }
         else
         {
            GameSounds.play("dialog_win");
         }
         if(§_-Br§.§_-f2k§)
         {
            addChild(new §_-Si§(globalToLocal(new Point(16,65)),new Point(this.§_-31T§.x + 23,this.§_-31T§.y + 32),false));
         }
      }
      
      override protected function init(param1:Class) : void
      {
         super.init(param1);
         var _loc2_:TextFormat = new TextFormat(null,14,8877877,true,null,null,null,null,TextFormatAlign.CENTER);
         this.§_-H2Q§ = new Sprite();
         this.§_-H2Q§.x = 39;
         this.§_-H2Q§.y = 23;
         addChild(this.§_-H2Q§);
         var _loc3_:DisplayObject = new ImageBgNutsEndRound();
         new §_-Hb§(_loc3_,gls("Орехи"));
         _loc3_.x = 226;
         _loc3_.y = 39;
         this.§_-H2Q§.addChild(_loc3_);
         _loc3_ = new ImageBgTimeEndRound();
         _loc3_.x = 32;
         _loc3_.y = 58;
         new §_-Hb§(_loc3_,gls("Время прохождения"));
         this.§_-H2Q§.addChild(_loc3_);
         this.§_-kf§ = new ImageBgStarEndRound();
         this.§_-kf§.x = 115;
         this.§_-kf§.y = 39;
         new §_-Hb§(this.§_-kf§,gls("Опыт"));
         this.§_-H2Q§.addChild(this.§_-kf§);
         this.§_-k2i§ = this.§_-H2Q§.addChild(new §_-22V§("",249,48,_loc2_,45)) as §_-22V§;
         this.§_-31T§ = this.§_-H2Q§.addChild(new §_-22V§("",142,48,_loc2_,45)) as §_-22V§;
         this.§_-j2N§ = this.§_-H2Q§.addChild(new §_-22V§("-:--",13,48,_loc2_,60)) as §_-22V§;
         this.§_-13L§ = new §_-22V§("",105,-145,TEXT_FORMAT,145);
         this.§_-13L§.filters = [new DropShadowFilter(0,0,7147036,1,3,3,2)];
         this.§_-O1B§.addChild(this.§_-13L§);
         this.§_-p1B§();
         setBgHeight = 220;
      }
      
      override protected function §_-o14§(param1:ListDataEvent) : void
      {
         super.§_-o14§(param1);
         this.§_-p1B§();
      }
      
      override protected function §_-l2F§(param1:ListDataEvent) : void
      {
         super.§_-l2F§(param1);
         var _loc2_:§_-jo§ = this.§_-w2T§.self;
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_.number != this.§_-Z§)
         {
            this.§_-Eu§(_loc2_.number);
         }
         this.§_-j2N§.text = _loc2_.isDead || !_loc2_.§_-q2G§ ? "-:--" : §_-ex§.§_-p1x§(_loc2_.time);
         this.§_-p1B§();
      }
      
      public function §_-Eu§(param1:int) : void
      {
         this.§_-Z§ = param1;
         this.§_-13L§.text = String(param1 + 1);
         if(param1 < 3)
         {
            this.§_-h1X§.text = gls("Ты пришел") + " " + StringUtil.§_-Q1p§(this.§_-Z§ + 1);
         }
         else
         {
            this.§_-h1X§.text = gls("Поздравляем!");
         }
         if(this.animation != null && this.§_-O1B§.contains(this.animation))
         {
            this.§_-O1B§.removeChild(this.animation);
         }
         var _loc2_:TextFormat = this.§_-13L§.getTextFormat(0);
         var _loc3_:§_-nO§ = new §_-nO§();
         this.§_-Im§ = false;
         switch(param1)
         {
            case 0:
               _loc2_.color = 16449495;
               _loc3_.§_-bb§(0,0,0,0);
               this.animation = new MovieEndRound1();
               break;
            case 1:
               _loc2_.color = 14277081;
               _loc3_.§_-bb§(0,0,0,0);
               this.animation = new MovieEndRound2();
               break;
            case 2:
               _loc2_.color = 16763569;
               _loc3_.§_-bb§(0,0,0,0);
               this.animation = new MovieEndRound3();
               break;
            default:
               _loc2_.color = 16777215;
               _loc3_.§_-bb§(0,0,0,-152);
               this.animation = new MovieEndRoundOther();
               this.§_-Im§ = true;
         }
         this.animation.x = 175;
         this.animation.y = 63;
         §_-63K§.§_-e2l§(this.animation);
         this.§_-b2s§.filters = [new ColorMatrixFilter(_loc3_)];
         this.§_-13L§.setTextFormat(_loc2_,0);
         this.§_-O1B§.addChildAt(this.animation,0);
      }
      
      public function §_-p1B§() : void
      {
         this.§_-k2i§.text = §_-33A§.§_-xB§.toString();
         this.§_-31T§.text = §_-33A§.§_-C3h§.toString();
      }
   }
}


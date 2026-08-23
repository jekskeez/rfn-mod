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
   import utils.§_-63K§;
   import utils.§_-ex§;
   import utils.§_-nO§;
   import views.§_-Si§;
   
   public class §_-iy§ extends §_-31r§
   {
      
      private static const TEXT_FORMAT:TextFormat = new TextFormat(§_-22V§.§_-pJ§,90,16777215,null,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-N2c§:TextFormat = new TextFormat(null,14,8877877,true,null,null,null,null,TextFormatAlign.CENTER);
      
      private var §_-k2i§:§_-22V§ = null;
      
      private var §_-G26§:§_-22V§ = null;
      
      private var §_-31T§:§_-22V§ = null;
      
      protected var §_-j2N§:§_-22V§ = null;
      
      protected var §_-13L§:§_-22V§ = null;
      
      protected var §_-H2Q§:Sprite = null;
      
      private var §_-W2o§:DisplayObject = null;
      
      private var §_-kf§:DisplayObject = null;
      
      public function §_-iy§()
      {
         super(MovieEndRoundShaman);
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-p1B§();
         §_-63K§.§_-e2l§(this.animation);
         GameSounds.play("dialog_shaman");
         if(§_-Br§.§_-f2k§)
         {
            addChild(new §_-Si§(globalToLocal(new Point(10,65)),new Point(this.§_-31T§.x + 23,this.§_-31T§.y + 32),false));
            addChild(new §_-Si§(globalToLocal(new Point(20,65)),new Point(this.§_-G26§.x + 23,this.§_-G26§.y + 32),true));
         }
      }
      
      override protected function init(param1:Class) : void
      {
         super.init(param1);
         this.§_-H2Q§ = new Sprite();
         this.§_-H2Q§.x = 39;
         this.§_-H2Q§.y = 23;
         addChild(this.§_-H2Q§);
         var _loc2_:DisplayObject = new ImageBgNutsEndRound();
         new §_-Hb§(_loc2_,gls("Орехи"));
         _loc2_.x = 241;
         _loc2_.y = 39;
         this.§_-H2Q§.addChild(_loc2_);
         _loc2_ = new ImageBgTimeEndRound();
         _loc2_.x = 19;
         _loc2_.y = 58;
         new §_-Hb§(_loc2_,gls("Время прохождения"));
         this.§_-H2Q§.addChild(_loc2_);
         this.§_-W2o§ = new ImageBgManaEndRound();
         this.§_-W2o§.x = 80;
         this.§_-W2o§.y = 44;
         new §_-Hb§(this.§_-W2o§,gls("Шаманский опыт"));
         this.§_-H2Q§.addChild(this.§_-W2o§);
         this.§_-kf§ = new ImageBgStarEndRound();
         this.§_-kf§.x = 158;
         this.§_-kf§.y = 39;
         new §_-Hb§(this.§_-kf§,gls("Опыт"));
         this.§_-H2Q§.addChild(this.§_-kf§);
         this.§_-h1X§.text = gls("Поздравляем!");
         this.§_-k2i§ = this.§_-H2Q§.addChild(new §_-22V§("",262,48,§_-N2c§,45)) as §_-22V§;
         this.§_-j2N§ = this.§_-H2Q§.addChild(new §_-22V§("-:--",3,48,§_-N2c§,60)) as §_-22V§;
         this.§_-G26§ = this.§_-H2Q§.addChild(new §_-22V§("",103,48,§_-N2c§,45)) as §_-22V§;
         this.§_-31T§ = this.§_-H2Q§.addChild(new §_-22V§("",186,48,§_-N2c§,45)) as §_-22V§;
         this.§_-13L§ = new §_-22V§("",106,-138,TEXT_FORMAT,145);
         this.§_-13L§.filters = [new DropShadowFilter(0,0,7147036,1,3,3,2)];
         this.§_-O1B§.addChild(this.§_-13L§);
         var _loc3_:§_-nO§ = new §_-nO§();
         _loc3_.§_-bb§(0,0,0,-87);
         §_-63K§.§_-e2l§(this.animation);
         this.§_-b2s§.filters = [new ColorMatrixFilter(_loc3_)];
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
         this.§_-j2N§.text = _loc2_.isDead || !_loc2_.§_-q2G§ ? "-:--" : §_-ex§.§_-p1x§(_loc2_.time);
         this.§_-p1B§();
      }
      
      public function §_-p1B§() : void
      {
         this.§_-k2i§.text = §_-33A§.§_-xB§.toString();
         this.§_-G26§.text = §_-33A§.§_-QO§.toString();
         this.§_-31T§.text = §_-33A§.§_-C3h§.toString();
      }
   }
}


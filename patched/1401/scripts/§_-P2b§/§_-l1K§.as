package §_-P2b§
{
   import §_-A3e§.§_-rl§;
   import flash.display.MovieClip;
   
   public class §_-l1K§ extends §_-rl§
   {
      
      public function §_-l1K§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get activeTime() : Number
      {
         return 7;
      }
      
      override protected function §_-Y2U§() : MovieClip
      {
         var answer:MovieClip = null;
         answer = new PerkSnowMaidenView();
         answer.scaleX = answer.scaleY = 0.7;
         answer.y -= 60;
         answer.addFrameScript(answer.totalFrames - 1,function():void
         {
            answer.gotoAndPlay(16);
         });
         return answer;
      }
   }
}

